using System;
using System.Drawing;
using System.Collections.Generic;

using MonoTouch.Foundation;
using MonoTouch.UIKit;
using MonoTouch.AVFoundation;

namespace Gossip
{
	public partial class MainViewController : UIViewController
	{
		private double flatteryDamage = 0; // Used only when Story.Debug = true
		private double suspectDamage = 0; // Used only when Story.Debug = true

		// Don't like handling ButtonTypes in Story.cs, feel it should be here
//		public enum ButtonType { UpArrow = 0, DownArrow = 1, Enter = 2, Rules = 3, Tips = 15 }

		private Random rand; // = new Random(27);
		private NSTimer gameLoopTimer;
		private MainView mainView;
		private AVAudioPlayer audioPlayer;

		public OptionsViewController ovc;

		static bool UserInterfaceIdiomIsPhone {
			get { return UIDevice.CurrentDevice.UserInterfaceIdiom == UIUserInterfaceIdiom.Phone; }
		}
		
		public MainViewController ()
			: base (UserInterfaceIdiomIsPhone ? "MainViewController_iPhone" : "MainViewController_iPad", null)
		{
			//mainView = (MainView)this.View;
			mainView = new MainView();
			mainView.mvc = this;

			InitializeData();
			InitializeGame();
	
			GameLoop();
		}
		
		public override void DidReceiveMemoryWarning ()
		{
			// Releases the view if it doesn't have a superview.
			base.DidReceiveMemoryWarning ();
			
			// Release any cached data, images, etc that aren't in use.
		}

		public override void ViewDidLoad ()
		{
			base.ViewDidLoad ();

			/*mainView = (MainView)this.View;
			//mainView.mvc = this;

			InitializeData();
			InitializeGame();

			GameLoop();*/
		}

		public override void ViewWillAppear (bool animated)
		{

		}

		public override void ViewWillDisappear(bool animated)
		{
			base.ViewWillDisappear(animated);

		}

		[Obsolete]
		public override bool ShouldAutorotateToInterfaceOrientation (UIInterfaceOrientation toInterfaceOrientation)
		{
			// Return true for supported orientations
			if (UserInterfaceIdiomIsPhone) {
				return (toInterfaceOrientation != UIInterfaceOrientation.PortraitUpsideDown);
			} else {
				return true;
			}
		}

		public override bool PrefersStatusBarHidden()
		{
			return true;
		}

		private void GameLoop()
		{
//			Console.WriteLine("GameLoop hit - {0}", DateTime.Now);

			switch (Story.Phase) {
			case Story.PlayerSelectsCallee: // Prompt player for selection
				if (Story.Debug)
					mainView.phase.SetNeedsDisplay();

				PostTurn((Story.MaxTurns - Story.Turn).ToString());

				GetButtonView(Story.Button.UpArrow).Enabled = false;
				GetButtonView(Story.Button.DownArrow).Enabled = false;
				GetButtonView(Story.Button.Enter).Enabled = false;

				GetButtonView(Story.Button.Rules).Enabled = true;
				GetButtonView(Story.Button.Tips).Enabled = true;

				ClearAllHalos();
				DrawHalo(GetCharacterView(Story.Caller), UIColor.White, true);
				PostMessage("Select somebody to call");

				// Halo characters that are not the Player
				for (int j = 0; j < Story.Characters; ++j)
				{
					if (j != Story.Player)
					{
						DrawHalo(GetCharacterView(j), UIColor.Blue, false);
					}
				}

				if (Story.Selected != Story.Nobody && Story.Selected != Story.Caller && Story.Selected <= Story.MaxCharacters - 1)
				{
					Story.Callee = Story.Selected;
					Story.Selected = Story.Nobody;

					DrawHalo(GetCharacterView(Story.Callee), UIColor.Blue, true);
					PostMessage(string.Empty);

					// Unhalo characters that weren't selected
					for (int j = 0; j < Story.Characters; ++j)
					{
						if ( j != Story.Player && j != Story.Callee)
						{
							DrawHalo(GetCharacterView (j), UIColor.Black, false);
						}
					}

					 
					Story.Phase = Story.Ring;
				}

				break;

			case Story.Ring: 
				if (Story.Debug) mainView.phase.SetNeedsDisplay();

				PlaySound(GetSound(Story.Callee, Story.SoundType.Ring));

				PlaySound(GetSound(Story.Callee, Story.SoundType.Hello));
				DrawFace(GetCharacterView(Story.Callee), (int)Story.AffinityLevel.Hello); 

				Story.Phase = Story.PlayerSelectsPredicate;

				break;

			case Story.PlayerSelectsPredicate: // Prompt player, haloize candidates
				if (Story.Debug) mainView.phase.SetNeedsDisplay();

				PostMessage("Select somebody to gossip about");

				// Halo characters that are not Caller or Callee
				for (int j = 0; j < Story.Characters; ++j)
				{
					if (j != Story.Player && j != Story.Callee)
					{
						DrawHalo(GetCharacterView(j), UIColor.Magenta, false);
					}
				}

				if (Story.Selected != Story.Nobody && Story.Selected != Story.Caller && Story.Selected != Story.Callee)
				{
					Story.Predicate = Story.Selected;
					Story.Selected = Story.Nobody;

					PostMessage(string.Empty);

					DrawFace(GetCharacterView(Story.Callee), (int)Story.AffinityLevel.SoSo); 
					DrawHalo(GetCharacterView(Story.Predicate), UIColor.Magenta, true);

					// Unhalo characters that weren't selected as Predicate
					for (int j = 0; j < Story.Characters; ++j)
					{
						if (j != Story.Player && j != Story.Callee && j != Story.Predicate)
						{
							DrawHalo(GetCharacterView(j), UIColor.Black, false);
						}
					}

					Story.CurrentAffinity = GetAffinityIndex(Story.Caller, Story.Predicate);

					GetButtonView(Story.Button.UpArrow).Enabled = Story.CurrentAffinity < 8;
					GetButtonView(Story.Button.DownArrow).Enabled = Story.CurrentAffinity > 0;
					GetButtonView (Story.Button.Enter).Enabled = true;

					Story.Phase = Story.PlayerDeclaresDirectAffinity;
				}

				break;

			case Story.PlayerDeclaresDirectAffinity:
				if (Story.Debug) mainView.phase.SetNeedsDisplay();

				HilightSpoke(Story.Caller, Story.Predicate, false);

				DeclareAffinity(Story.CurrentAffinity, Story.Player, Story.Callee, Story.Predicate);

				if (Story.Selected != Story.Nobody && Story.Selected == (int)Story.Button.Enter)
				{
					Story.Selected = Story.Nobody;
					Story.Phase = Story.ReactionAnimation1;
				}

				break;
			case Story.ReactionAnimation1: // Quick reaction of listener to player
			case Story.ReactionAnimation2:
			case Story.ReactionAnimation3:
			case Story.ReactionAnimation4:
				if (Story.Debug)
					mainView.phase.SetNeedsDisplay();

				DrawFace(GetCharacterView(Story.Caller), (int)Story.AffinityLevel.SoSo);

				GetButtonView(Story.Button.UpArrow).Enabled = false;
				GetButtonView(Story.Button.DownArrow).Enabled = false;
				GetButtonView(Story.Button.Enter).Enabled = false;

				if (Story.Phase == Story.NpcHangsUp) {
					PlaySound(GetSound(Story.Callee, Story.SoundType.Goodbye));
				}

				int speaker = 0;

				if (Story.Player == Story.Caller)
					speaker = Story.Callee;
				else
					speaker = Story.Caller;

				string message = Story.Names[speaker] + " ";

				if (Story.Phase == Story.ReactionAnimation1 || Story.Phase == Story.ReactionAnimation3) {
					// Direct reaction
					DrawFace(GetCharacterView(Story.Callee), Story.FeedbackFace[Story.ILikeWhatIHear, Story.Suspect]);
					DrawHalo(GetCharacterView(Story.Predicate), UIColor.Magenta, true); 
					HilightSpoke(speaker, Story.Player, true);
					message += Story.DirectFeedback[speaker, Story.ILikeWhatIHear, Story.Suspect];
				} else {
					// Indirect reaction
					DrawFace(GetCharacterView(Story.Callee), Story.FeedbackFace[2, Story.Suspect]);
					DrawHalo(GetCharacterView(Story.Predicate), UIColor.Magenta, true);
					HilightSpoke(speaker, Story.Player, true);
					message += Story.IndirectFeedback[speaker, 2 - Story.Suspect];
				}
			
				PostMessage(message);
				++Story.Phase;

				break;
			case Story.NpcRespondsDirectAffinity: // Display NPC affinity
				if (Story.Debug) mainView.phase.SetNeedsDisplay();

				GetButtonView(Story.Button.Enter).Enabled = true;

				DrawHalo(GetCharacterView(Story.Predicate), UIColor.Magenta, true);
				HilightSpoke(Story.Callee, Story.Predicate, false);

				int affinity = GetAffinityIndex(Story.Callee, Story.Predicate);
				DeclareAffinity(affinity, Story.Callee, Story.Player, Story.Predicate);

				Story.CurrentAffinity = GetPAffinityIndex(Story.Player, Story.Predicate, Story.Callee);

				if (Story.Selected != Story.Nobody && Story.Selected == (int)Story.Button.Enter)
				{
					DrawHalo(GetCharacterView(Story.Predicate), UIColor.Magenta, true);
					DrawQuotes(GetCharacterView(Story.Predicate), true);

					GetButtonView(Story.Button.UpArrow).Enabled = true;
					GetButtonView(Story.Button.DownArrow).Enabled = true;
					GetButtonView(Story.Button.Enter).Enabled = true;

					Story.Selected = Story.Nobody;
					Story.Phase = Story.PlayerDeclaresIndirectAffinity;
				}

				break;
			case  Story.PlayerDeclaresIndirectAffinity:
				if (Story.Debug) mainView.phase.SetNeedsDisplay();

				DrawFace(GetCharacterView(Story.Callee), (int)Story.AffinityLevel.SoSo);

				HilightSpoke(Story.Predicate, Story.Callee, Story.Player);

				if (Story.Selected != Story.Nobody && Story.Selected == (int)Story.Button.Enter)
				{
					DeclareIndirectAffinity(Story.CurrentAffinity,
					                        Story.Predicate,
					                        Story.Player,
					                        Story.Callee,
					                        Story.Callee);

					DrawHalo(GetCharacterView(Story.Predicate), UIColor.Magenta, true);
					DrawQuotes(GetCharacterView(Story.Predicate), true);

					Story.Selected = Story.Nobody;
					Story.Phase = Story.ReactionAnimation2;
				}

				break;
			case Story.NpcRespondsIndirectAffinity:
				if (Story.Debug) mainView.phase.SetNeedsDisplay();

				GetButtonView(Story.Button.UpArrow).Enabled = false;
				GetButtonView(Story.Button.DownArrow).Enabled = false;
				GetButtonView(Story.Button.Enter).Enabled = true;

				DrawFace(GetCharacterView(Story.Callee), (int)Story.AffinityLevel.SoSo);

				HilightSpoke(Story.Predicate, Story.Player, Story.Callee);

				if (Story.Selected != Story.Nobody && Story.Selected == (int)Story.Button.Enter)
				{
					UnhilightSpoke();

					DeclareIndirectAffinity(GetPAffinityIndex(Story.Callee, Story.Predicate, Story.Player),
					                        Story.Predicate,
					                        Story.Callee,
					                        Story.Player,
					                        Story.Player);


					Story.Selected = Story.Nobody;
					Story.Phase = Story.PlayerHangsUp;
				}
				
				break;
			case Story.PlayerHangsUp:
				if (Story.Debug) mainView.phase.SetNeedsDisplay();

				GetButtonView(Story.Button.Enter).Enabled = false;

				ClearAllHalos();
				EraseQuotes(GetCharacterView(Story.Predicate));

				PlaySound(GetSound(Story.Callee, Story.SoundType.Goodbye));
				PostMessage("Goodbye!");

				Story.Phase = Story.NpcTurn;

				break;
			case Story.NpcTurn:
				if (Story.Debug) mainView.phase.SetNeedsDisplay();

				PostMessage("");
				ClearAllHalos();

				Story.Caller = 1;
				Story.Callee = Story.Nobody;

				RunNPCTurn(); 

				break;
			case Story.NpcCallsPlayer: // Calling animation
				if (Story.Debug) mainView.phase.SetNeedsDisplay();

				PlaySound(GetSound(Story.Callee, Story.SoundType.Hello));

				Story.Phase = Story.NpcDeclaresDirectAffinity;

				break;
			case Story.NpcDeclaresDirectAffinity: // Display NPC affinity
				if (Story.Debug) mainView.phase.SetNeedsDisplay();

				GetButtonView(Story.Button.Enter).Enabled = true;

				DrawHalo(GetCharacterView(Story.Predicate), UIColor.Magenta, true);
				HilightSpoke(Story.Caller, Story.Predicate, false);
				DrawFace(GetCharacterView(Story.Callee), (int)Story.AffinityLevel.Hello);

				if (Story.Selected != Story.Nobody && Story.Selected == (int)Story.Button.Enter)
				{
					DeclareAffinity(GetAffinityIndex(Story.Caller, Story.Predicate), Story.Caller, Story.Player, Story.Predicate);

					Story.CurrentAffinity = GetPAffinityIndex(Story.Player, Story.Player, Story.Predicate);

					GetButtonView(Story.Button.UpArrow).Enabled = true;
					GetButtonView(Story.Button.DownArrow).Enabled = true;
					GetButtonView(Story.Button.Enter).Enabled = true;

					Story.Selected = Story.Nobody;
					Story.Phase = Story.PlayerRespondsDirectAffinity;
				}

				break;
			case Story.PlayerRespondsDirectAffinity: // Player edits affinity
				if (Story.Debug) mainView.phase.SetNeedsDisplay();

				DrawFace(GetCharacterView(Story.Caller), (int)Story.AffinityLevel.SoSo);
				DrawHalo(GetCharacterView(Story.Predicate), UIColor.Magenta, true);
				HilightSpoke(Story.Callee, Story.Predicate, false);

				if (Story.Selected != Story.Nobody && Story.Selected == (int)Story.Button.Enter)
				{
					DeclareAffinity(Story.CurrentAffinity, Story.Player, Story.Caller, Story.Predicate);

					DrawHalo(GetCharacterView(Story.Predicate), UIColor.Magenta, true);
					DrawQuotes(GetCharacterView(Story.Predicate), true);

					Story.Selected = Story.Nobody;
					Story.Phase = Story.ReactionAnimation3;
				}

				break;
			case Story.NpcDeclaresIndirectAffinity:
				if (Story.Debug) mainView.phase.SetNeedsDisplay();

				GetButtonView(Story.Button.Enter).Enabled = true;

				DrawFace(GetCharacterView(Story.Caller), (int)Story.AffinityLevel.SoSo);

				HilightSpoke(Story.Predicate, Story.Player, Story.Caller);

				if (Story.Selected != Story.Nobody && Story.Selected == (int)Story.Button.Enter)
				{
					DeclareIndirectAffinity(GetPAffinityIndex(Story.Caller, Story.Predicate, Story.Player),
					                        Story.Predicate,
					                        Story.Caller,
					                        Story.Player,
					                        Story.Player);

					Story.CurrentAffinity = GetPAffinityIndex(Story.Player, Story.Predicate, Story.Caller);

					DrawHalo(GetCharacterView(Story.Predicate), UIColor.Magenta, true);
					DrawQuotes(GetCharacterView(Story.Predicate), true);

					GetButtonView(Story.Button.UpArrow).Enabled = true;
					GetButtonView(Story.Button.DownArrow).Enabled = true;
					GetButtonView(Story.Button.Enter).Enabled = true;

					Story.Selected = Story.Nobody;
					Story.Phase = Story.PlayerRespondsIndirectAffinity;
				}

				break;
			case Story.PlayerRespondsIndirectAffinity:
				if (Story.Debug) mainView.phase.SetNeedsDisplay();

				HilightSpoke(Story.Predicate, Story.Caller, Story.Player);

				DeclareIndirectAffinity(Story.CurrentAffinity, Story.Predicate, Story.Player, Story.Caller, Story.Caller);

				if (Story.Selected != Story.Nobody && Story.Selected == (int)Story.Button.Enter)
				{
					UnhilightSpoke();

					Story.Selected = Story.Nobody;
					Story.Phase = Story.ReactionAnimation4;
				}

				break;
			case Story.NpcHangsUp: // Goodbye animation
				if (Story.Debug)
					mainView.phase.SetNeedsDisplay();

				ClearAllHalos();
				EraseQuotes(GetCharacterView(Story.Predicate));
				UnhilightSpoke();

				PostMessage("Goodbye!");

				NSRunLoop.Current.RunUntil(NSRunLoopMode.Default, NSDate.Now);

				PlaySound(GetSound(Story.Callee, Story.SoundType.Goodbye));

				NextPerson1();
				
				break;
			}
		}

		private void InitializeData()
		{
			Story.Names[0] = "Bara";
			Story.Names[1] = "Owen";
			Story.Names[2] = "Max";
			Story.Names[3] = "Ella";
			Story.Names[4] = "Mort";
			Story.Names[5] = "Zoe";

			// Personality traits of the characters (UNumbers, NOT BNumbers)
			Story.Dishonest[0] = 0.0;
			Story.Dishonest[1] = 0.8;
			Story.Dishonest[2] = 0.0;
			Story.Dishonest[3] = 0.7;
			Story.Dishonest[4] = 0.8;
			Story.Dishonest[5] = 0.0;

			Story.Gullible[0] = 0.5;
			Story.Gullible[1] = 0.2;
			Story.Gullible[2] = 0.8;
			Story.Gullible[3] = 0.5;
			Story.Gullible[4] = 0.0; // -0.25; // #2 07.20.13
			Story.Gullible[5] = 0.7;

			Story.Vain[0] = 0.0;
			Story.Vain[1] = 0.4;
			Story.Vain[2] = 0.7;
			Story.Vain[3] = 0.3;
			Story.Vain[4] = 0.5;
			Story.Vain[5] = 0.8;

			// Red through Gray to Blue
			Story.AffinityLevelColor[9] = UIColor.FromRGBA(0, 0, 0, 0);   // Transparent
			Story.AffinityLevelColor[8] = UIColor.FromRGB(255, 0, 0);     // Red
			Story.AffinityLevelColor[7] = UIColor.FromRGB(224, 32, 32);   //
			Story.AffinityLevelColor[6] = UIColor.FromRGB(192, 64, 64);   //
			Story.AffinityLevelColor[5] = UIColor.FromRGB(160, 96, 96);   //
			Story.AffinityLevelColor[4] = UIColor.FromRGB(128, 128, 128); // Gray
			Story.AffinityLevelColor[3] = UIColor.FromRGB(96, 96, 160);   //
			Story.AffinityLevelColor[2] = UIColor.FromRGB(64, 64, 192);   //
			Story.AffinityLevelColor[1] = UIColor.FromRGB(32, 32, 224);   //
			Story.AffinityLevelColor[0] = UIColor.FromRGB(0, 0, 255);     // Blue

			Story.AffinityLevelText[9] = "hello";
			Story.AffinityLevelText[8] = "adorable";
			Story.AffinityLevelText[7] = "great";
			Story.AffinityLevelText[6] = "nice";
			Story.AffinityLevelText[5] = "pleasant";
			Story.AffinityLevelText[4] = "so-so";
			Story.AffinityLevelText[3] = "unpleasant";
			Story.AffinityLevelText[2] = "not nice";
			Story.AffinityLevelText[1] = "nasty";
			Story.AffinityLevelText[0] = "hateful";

			Story.GuyDescription[0, 0] = "hateful";
			Story.GuyDescription[1, 0] = "an absolute jerk";
			Story.GuyDescription[2, 0] = "despicable";
			Story.GuyDescription[3, 0] = "horrible";
			Story.GuyDescription[4, 0] = "loathsome";
			Story.GuyDescription[5, 0] = "totally scuzzy";

			Story.GuyDescription[0, 1] = "nasty";
			Story.GuyDescription[1, 1] = "gross";
			Story.GuyDescription[2, 1] = "awful";
			Story.GuyDescription[3, 1] = "obnoxious";
			Story.GuyDescription[4, 1] = "yuckers";
			Story.GuyDescription[5, 1] = "an ickyosaurus";

			Story.GuyDescription[0, 2] = "not nice";
			Story.GuyDescription[1, 2] = "a downer";
			Story.GuyDescription[2, 2] = "annoying";
			Story.GuyDescription[3, 2] = "unkind";
			Story.GuyDescription[4, 2] = "disagreeable";
			Story.GuyDescription[5, 2] = "ugh-ville";

			Story.GuyDescription[0, 3] = "unpleasant";
			Story.GuyDescription[1, 3] = "bleh";
			Story.GuyDescription[2, 3] = "a little negatory";
			Story.GuyDescription[3, 3] = "zzzzzz...";
			Story.GuyDescription[4, 3] = "uncool";
			Story.GuyDescription[5, 3] = "a nothingburger";

			Story.GuyDescription[0, 4] = "so-so";
			Story.GuyDescription[1, 4] = "meh";
			Story.GuyDescription[2, 4] = "OK, I guess";
			Story.GuyDescription[3, 4] = "yawn-worthy";
			Story.GuyDescription[4, 4] = "a who-cares kinda guy";
			Story.GuyDescription[5, 4] = "shrug-erific";

			Story.GuyDescription[0, 5] = "pleasant";
			Story.GuyDescription[1, 5] = "friendly";
			Story.GuyDescription[2, 5] = "a 6 out of 10";
			Story.GuyDescription[3, 5] = "not so bad";
			Story.GuyDescription[4, 5] = "better than average";
			Story.GuyDescription[5, 5] = "agreeable";

			Story.GuyDescription[0, 6] = "nice";
			Story.GuyDescription[1, 6] = "straight-up";
			Story.GuyDescription[2, 6] = "good";
			Story.GuyDescription[3, 6] = "swell";
			Story.GuyDescription[4, 6] = "fine";
			Story.GuyDescription[5, 6] = "two steps short of excellent";

			Story.GuyDescription[0, 7] = "great";
			Story.GuyDescription[1, 7] = "cool";
			Story.GuyDescription[2, 7] = "really nice";
			Story.GuyDescription[3, 7] = "sweet";
			Story.GuyDescription[4, 7] = "a really good guy";
			Story.GuyDescription[5, 7] = "SO badass!";

			Story.GuyDescription[0, 8] = "adorable";
			Story.GuyDescription[1, 8] = "way cool";
			Story.GuyDescription[2, 8] = "awesome";
			Story.GuyDescription[3, 8] = "super cute";
			Story.GuyDescription[4, 8] = "amazing";
			Story.GuyDescription[5, 8] = "just TOO much";

			Story.GalDescription[0, 0] = "hateful";
			Story.GalDescription[1, 0] = "scum";
			Story.GalDescription[2, 0] = "Darth Vader in a dress";
			Story.GalDescription[3, 0] = "bitchy";
			Story.GalDescription[4, 0] = "just evil";
			Story.GalDescription[5, 0] = "like, super-nasty";

			Story.GalDescription[0, 1] = "nasty";
			Story.GalDescription[1, 1] = "gross";
			Story.GalDescription[2, 1] = "minus ungood";
			Story.GalDescription[3, 1] = "a yuck-face";
			Story.GalDescription[4, 1] = "crude";
			Story.GalDescription[5, 1] = "majorly not nice";
			
			Story.GalDescription[0, 2] = "not nice";
			Story.GalDescription[1, 2] = "Loser City";
			Story.GalDescription[2, 2] = "annoying";
			Story.GalDescription[3, 2] = "unkind";
			Story.GalDescription[4, 2] = "a downer";
			Story.GalDescription[5, 2] = "a loser";
			
			Story.GalDescription[0, 3] = "unpleasant";
			Story.GalDescription[1, 3] = "is like runny ketchup";
			Story.GalDescription[2, 3] = "a little negatory";
			Story.GalDescription[3, 3] = "'zzzzzz...'";
			Story.GalDescription[4, 3] = "disagreeable";
			Story.GalDescription[5, 3] = "not classy";
			
			Story.GalDescription[0, 4] = "so-so";
			Story.GalDescription[1, 4] = "a big yawn";
			Story.GalDescription[2, 4] = "in the middle of the curve";
			Story.GalDescription[3, 4] = "adequate";
			Story.GalDescription[4, 4] = "meh";
			Story.GalDescription[5, 4] = "'not on my radar'";
			
			Story.GalDescription[0, 5] = "pleasant";
			Story.GalDescription[1, 5] = "fair";
			Story.GalDescription[2, 5] = "not without some charm";
			Story.GalDescription[3, 5] = "well-meaning";
			Story.GalDescription[4, 5] = "OK in my book";
			Story.GalDescription[5, 5] = "nice but not on my iPhone";
			
			Story.GalDescription[0, 6] = "nice";
			Story.GalDescription[1, 6] = "one good chickie";
			Story.GalDescription[2, 6] = "'somebody I like'";
			Story.GalDescription[3, 6] = "worthy";
			Story.GalDescription[4, 6] = "one of the nicer people";
			Story.GalDescription[5, 6] = "kinda excellent";
			
			Story.GalDescription[0, 7] = "great";
			Story.GalDescription[1, 7] = "wicked good";
			Story.GalDescription[2, 7] = "really nice";
			Story.GalDescription[3, 7] = "a lovely person";
			Story.GalDescription[4, 7] = "like a sister";
			Story.GalDescription[5, 7] = "cool-orific";
			
			Story.GalDescription[0, 8] = "my bff";
			Story.GalDescription[1, 8] = "gorgeous";
			Story.GalDescription[2, 8] = "definitely a 10";
			Story.GalDescription[3, 8] = "the best";
			Story.GalDescription[4, 8] = "'number 1 in my book'";
			Story.GalDescription[5, 8] = "so very fab";

			Story.DirectFeedback[0, 0, 0] = ".";
			Story.DirectFeedback[1, 0, 0] = "is angry at you.";
			Story.DirectFeedback[2, 0, 0] = "doesn't like at all what he's hearing.";
			Story.DirectFeedback[3, 0, 0] = "is upset with you.";
			Story.DirectFeedback[4, 0, 0] = "expresses great displeasure.";
			Story.DirectFeedback[5, 0, 0] = "is, like, totally made at you.";

			Story.DirectFeedback[0, 1, 0] = ".";
			Story.DirectFeedback[1, 1, 0] = "doesn't have anything to say.";
			Story.DirectFeedback[2, 1, 0] = "is silent.";
			Story.DirectFeedback[3, 1, 0] = "talks about her dog.";
			Story.DirectFeedback[4, 1, 0] = "seems OK with you.";
			Story.DirectFeedback[5, 1, 0] = "thanks you for being honest.";

			Story.DirectFeedback[0, 2, 0] = ".";
			Story.DirectFeedback[1, 2, 0] = "is quite pleased with you.";
			Story.DirectFeedback[2, 2, 0] = "is really happy you said that.";
			Story.DirectFeedback[3, 2, 0] = "expresses delight at your statement.";
			Story.DirectFeedback[4, 2, 0] = "says 'Right on!'";
			Story.DirectFeedback[5, 2, 0] = "agrees like, totally.";

			Story.DirectFeedback[0, 0, 1] = ".";
			Story.DirectFeedback[1, 0, 1] = "is angry at you and expresses some doubts.";
			Story.DirectFeedback[2, 0, 1] = "disses you and doesn't take you seriously.";
			Story.DirectFeedback[3, 0, 1] = "gets mad and says she isn't convinced.";
			Story.DirectFeedback[4, 0, 1] = "says 'Rats!' and seem uncertain about your claim.";
			Story.DirectFeedback[5, 0, 1] = "is most seriously displeased and somewhat skeptical.";
			
			Story.DirectFeedback[0, 1, 1] = ".";
			Story.DirectFeedback[1, 1, 1] = "sounds irritated and says, 'Oh, really?'.";
			Story.DirectFeedback[2, 1, 1] = "is not happy with that and asks if you're sure.";
			Story.DirectFeedback[3, 1, 1] = "seems displeased and wonders where you heard that.";
			Story.DirectFeedback[4, 1, 1] = "grumbles and says 'That's, um, interesting.'";
			Story.DirectFeedback[5, 1, 1] = "says, 'My, my! That's not good. How very special!'";
			
			Story.DirectFeedback[0, 2, 1] = ".";
			Story.DirectFeedback[1, 2, 1] = "is pleased but seems skeptical.";
			Story.DirectFeedback[2, 2, 1] = "appreciates your statement, sorta.";
			Story.DirectFeedback[3, 2, 1] = "approves, but seems uncertain about you.";
			Story.DirectFeedback[4, 2, 1] = "responds pleasantly but tactfully.";
			Story.DirectFeedback[5, 2, 1] = "praises what you said -- a little too much.";

			Story.DirectFeedback[0, 0, 2] = ".";
			Story.DirectFeedback[1, 0, 2] = "calls you a nasty liar.";
			Story.DirectFeedback[2, 0, 2] = "is angry about your lying.";
			Story.DirectFeedback[3, 0, 2] = "accuses you of lying.";
			Story.DirectFeedback[4, 0, 2] = "says 'That is a lie!'";
			Story.DirectFeedback[5, 0, 2] = "says she's never heard such lies.";
			
			Story.DirectFeedback[0, 1, 2] = ".";
			Story.DirectFeedback[1, 1, 2] = "doesn't believe you.";
			Story.DirectFeedback[2, 1, 2] = "doesn't buy a word of it.";
			Story.DirectFeedback[3, 1, 2] = "doubts you.";
			Story.DirectFeedback[4, 1, 2] = "is very skeptical.";
			Story.DirectFeedback[5, 1, 2] = "is totally, totally unconvinced.";
			
			Story.DirectFeedback[0, 2, 2] = ".";
			Story.DirectFeedback[1, 2, 2] = "says, 'Yeah, sure.'";
			Story.DirectFeedback[2, 2, 2] = "is nice but clearly doesn't believe you.";
			Story.DirectFeedback[3, 2, 2] = "doesn't believe you, but is polite about it.";
			Story.DirectFeedback[4, 2, 2] = "says, 'Uh, gee, that's nice of you to say.'";
			Story.DirectFeedback[5, 2, 2] = "says 'I'm sure, honey.'";

			Story.IndirectFeedback[0, 0] = ".";
			Story.IndirectFeedback[1, 0] = "says that you're completely wrong.";
			Story.IndirectFeedback[2, 0] = "disagrees 100%.";
			Story.IndirectFeedback[3, 0] = "thinks you're just plain wrong.";
			Story.IndirectFeedback[4, 0] = "says he has the opposite feeling.";
			Story.IndirectFeedback[5, 0] = "says 'You're totally mistaken, dearie.'";

			Story.IndirectFeedback[0, 1] = ".";
			Story.IndirectFeedback[1, 1] = "doesn't comletely agree with you.";
			Story.IndirectFeedback[2, 1] = "has his doubts about what you say.";
			Story.IndirectFeedback[3, 1] = "suggests that you've been fooled.";
			Story.IndirectFeedback[4, 1] = "diplomatically waffles.";
			Story.IndirectFeedback[5, 1] = "says 'You're not quite right.'";

			Story.IndirectFeedback[0, 2] = ".";
			Story.IndirectFeedback[1, 2] = "thinks the same thing.";
			Story.IndirectFeedback[2, 2] = "is 100% sure you're right.";
			Story.IndirectFeedback[3, 2] = "confirms your assessment.";
			Story.IndirectFeedback[4, 2] = "says 'You nailed it!'";
			Story.IndirectFeedback[5, 2] = "agrees totally with everything you say.";

			// #3 07.20.13
			Story.FeedbackFace[0, 0] = 0;
			Story.FeedbackFace[0, 1] = 0;
			Story.FeedbackFace[0, 2] = 0;
			Story.FeedbackFace[1, 0] = 4;
			Story.FeedbackFace[1, 1] = 3;
			Story.FeedbackFace[1, 2] = 2;
			Story.FeedbackFace[2, 0] = 7;
			Story.FeedbackFace[2, 1] = 6;
			Story.FeedbackFace[2, 2] = 5;
		}

		internal void InitializeGame()
		{
			rand = new Random(27);

			Story.Quit = false;
			Story.Phase = Story.PlayerSelectsCallee;
			Story.Turn = 0;
			Story.MaxTurns = /*Story.Characters - (Story.Characters - 1);*/ 3 * (Story.Characters - 3);
			Story.Player = 0;
			Story.Caller = Story.Player; // The first turn goes to the player
			Story.Callee = Story.Nobody;
			Story.Selected = Story.Nobody;
			Story.CurrentAffinity = 0;
			Story.EndGame = false;

			if (Story.Debug) // Set timers to debug times (if we were using timers)
			{}
			else // Set timers to production times (if we were using timers)
			{}

			// These values must be reset at the beginning of the game
			for (int i = 0; i < Story.Characters; ++i)
			{
				// Initialize all afinities BEFORE initializing perceived affinities
				int j = i + 1;
				while (j < Story.Characters) {
					Story.Affinity[i, j] = 2 * rand.NextDouble() - 1;
					// Make affinities semi-symmetric
					Story.Affinity[j, i] = BSum (Story.Affinity[i, j], (2 * rand.NextDouble() - 1) / 4);
					++j;
				}
			}

			Story.HistoryBook.Clear(); // #3 07.20.13

			if (gameLoopTimer == null)
				gameLoopTimer = NSTimer.CreateRepeatingScheduledTimer(1.0, delegate { GameLoop(); });

			if (Story.Restart) {
				mainView.SetNeedsDisplay();
				Story.Restart = false;
			}
		}
	
		internal void ShowTipsScreen()
		{
			TipsViewController tvc = new TipsViewController();
			tvc.mvc = this;

			this.PresentViewController(tvc, false, null);
		}

		internal void ShowHelpScreen()
		{
			HelpViewController hvc = new HelpViewController();
			hvc.mvc = this;

			this.PresentViewController(hvc, false, null);
		}

		internal void RestartGame()
		{
			this.DismissViewController(false, null);
			this.ovc.RestartGame();
		}

		internal CharacterView GetCharacterView(int characterId)
		{
			CharacterView character = null;

			switch (characterId)
			{
			case (int)Story.Character.Bara:
				character = mainView.bara;
				break;
			case (int)Story.Character.Owen:
				character = mainView.owen;
				break;
			case (int)Story.Character.Max:
				character = mainView.max;
				break;
			case (int)Story.Character.Ella:
				character = mainView.ella;
				break;
			case (int)Story.Character.Mort:
				character = mainView.mort;
				break;
			case (int)Story.Character.Zoe:
				character = mainView.zoe;
				break;
			}

			return character;
		}

		internal void DrawFace(CharacterView character, int affinity)
		{
			character.Affinity = affinity;
			character.SetNeedsDisplay();

			NSRunLoop.Current.RunUntil(NSRunLoopMode.Default, NSDate.Now);
		}

		internal void ResetAllFaces()
		{
			for (int j = 0; j < Story.Characters; ++j)
			{
				DrawFace(GetCharacterView(j), (int)Story.AffinityLevel.SoSo);
			}
		}

		internal void DrawHalo(CharacterView character, UIColor color, bool filled)
		{
			character.SetHalo(true, color, filled);
			character.SetNeedsDisplay();
		}

		private void EraseHalo(CharacterView character)
		{
			character.SetHalo(false, UIColor.Black, true);
			character.SetNeedsDisplay();
		}

		private void DrawQuotes(CharacterView character, bool quoted)
		{
			character.quoted = quoted;
			character.SetNeedsDisplay();
		}

		private void EraseQuotes(CharacterView character)
		{
			character.quoted = false;
			character.SetNeedsDisplay();
		}

		private void ClearAllHalos()
		{
			for (int j = 0; j < Story.Characters; ++j)
			{
				DrawHalo(GetCharacterView(j), UIColor.Black, true);
			}
		}

		private string GetSound(int characterId, Story.SoundType type)
		{
			string sound = string.Empty;

			switch (characterId)
			{
			case (int)Story.Character.Bara:
				switch (type)
				{
				case Story.SoundType.Ring:
					sound = Resources.baraRingtone;
					break;
				case Story.SoundType.Hello:
					sound = Resources.baraSayHi;
					break;
				case Story.SoundType.Goodbye:
					sound = Resources.baraSayGoodbye;
					break;
				}
				break;
			case (int)Story.Character.Owen:
				switch (type)
				{
				case Story.SoundType.Ring:
					sound = Resources.owenRingtone;
					break;
				case Story.SoundType.Hello:
					sound = Resources.owenSayHi;
					break;
				case Story.SoundType.Goodbye:
					sound = Resources.owenSayGoodbye;
					break;
				}
				break;
			case (int)Story.Character.Max:
				switch (type)
				{
				case Story.SoundType.Ring:
					sound = Resources.maxRingtone;
					break;
				case Story.SoundType.Hello:
					sound = Resources.maxSayHi;
					break;
				case Story.SoundType.Goodbye:
					sound = Resources.maxSayGoodbye;
					break;
				}
				break;
			case (int)Story.Character.Ella:
				switch (type)
				{
				case Story.SoundType.Ring:
					sound = Resources.ellaRingtone;
					break;
				case Story.SoundType.Hello:
					sound = Resources.ellaSayHi;
					break;
				case Story.SoundType.Goodbye:
					sound = Resources.ellaSayGoodbye;
					break;
				}
				break;
			case (int)Story.Character.Mort:
				switch (type)
				{
				case Story.SoundType.Ring:
					sound = Resources.mortRingtone;
					break;
				case Story.SoundType.Hello:
					sound = Resources.mortSayHi;
					break;
				case Story.SoundType.Goodbye:
					sound = Resources.mortSayGoodbye;
					break;
				}
				break;
			case (int)Story.Character.Zoe:
				switch (type)
				{
				case Story.SoundType.Ring:
					sound = Resources.zoeRingtone;
					break;
				case Story.SoundType.Hello:
					sound = Resources.zoeSayHi;
					break;
				case Story.SoundType.Goodbye:
					sound = Resources.zoeSayGoodbye;
					break;
				}
				break;
			}

			return sound;
		}

		private void PlaySound(string sound)
		{
			NSUrl fileUrl = new NSUrl(sound);

			audioPlayer = AVAudioPlayer.FromUrl(fileUrl);
			audioPlayer.Play();

			while (audioPlayer.Playing) 
			{
			}
		}

		internal ButtonView GetButtonView(Story.Button /*ButtonType*/ type)
		{
			ButtonView button = null;

			switch (type) {
			case Story.Button.UpArrow:
				button = mainView.upArrow;
				break;
			case Story.Button.DownArrow:
				button = mainView.downArrow;
				break;
			case Story.Button.Enter:
				button = mainView.enter;
				break;
			case Story.Button.Rules:
				button = mainView.rules;
				break;
			case Story.Button.Tips:
				button = mainView.tips;
				break;
			}

			return button;
		}

		internal void HilightSpoke(int fromCharacter, int toCharacter, bool isDashed) 
		{
			mainView.hexagon.Hilight = true;
			mainView.hexagon.From = fromCharacter;
			mainView.hexagon.To = toCharacter;
			mainView.hexagon.Dashed = isDashed;
			mainView.hexagon.Speaker = Story.Nobody;

			mainView.hexagon.SetNeedsDisplay();
			//TODO: Force loop to run?
		}

		internal void HilightSpoke(int fromCharacter, int toCharacter, int speaker)
		{
			mainView.hexagon.Hilight = true;
			mainView.hexagon.From = fromCharacter;
			mainView.hexagon.To = toCharacter;
			mainView.hexagon.Dashed = false;
			mainView.hexagon.Speaker = speaker;

			mainView.hexagon.SetNeedsDisplay();
		}

		internal void UnhilightSpoke()
		{
			mainView.hexagon.Hilight = false;
			mainView.hexagon.SetNeedsDisplay();
		}

		private void PostTurn(string turn)
		{
			mainView.turn.SetText(turn);
			mainView.turn.SetNeedsDisplay();
		}

		internal void PostMessage(string message)
		{
			mainView.message.SetText(message);
			mainView.message.SetNeedsDisplay();
		}

		// This section contains the algorithms that drive the smarts of the game.
		// This is all number-crunching with no references to anything peculiar to input or graphics.
		// All the code from heare to the end of the program is confidential and shall not
		// be communicated to any party.

		private double Blend(double from, double to, double weight)
		{
			if (weight <= -1) weight = -1;
			if (weight >= 1) weight = 1;

			// This is a conversion from BNumber to UNumber
			double uWeightingFactor = 1 - ((1 - weight) / 2);
			double x = to * uWeightingFactor + from * (1.0f - uWeightingFactor);

			return x;
		}

		internal double BSum(double a, double b)
		{
			double x2 = BoundedInverseTransform(a);
			double x1 = BoundedInverseTransform(b);
			return BoundedTransform(x1 + x2);
		}

		private double BoundedInverseTransform(double boundedNumber)
		{
			if (boundedNumber > 0.0f) return (1.0f / (1.0f - boundedNumber)) - 1.0f;
			else return 1.0f - (1.0f / (1.0f + boundedNumber));
		}
		
		private double BoundedTransform(double unboundedNumber)
		{
			if (unboundedNumber > 0.0f) return 1.0 - (1.0 / (1.0 + unboundedNumber));
			else return (1.0 / (1.0 - unboundedNumber)) - 1.0;
		}

		internal int GetAffinityIndex(int iFromCharacter, int iToCharacter) 
		{
			int affinityIndex = BoundedToInteger(Story.Affinity[iFromCharacter, iToCharacter]);
			return affinityIndex;
		}

		internal int GetPAffinityIndex(int iPerceiver, int iFromCharacter, int iToCharacter)
		{
			int affinity = BoundedToInteger(Story.PerceivedAffinity[iPerceiver, iFromCharacter, iToCharacter]);
			return affinity;
		}

		private void DeclareIndirectAffinity(int value, int source, int speaker, int listener, int predicate)
		{
			// Record the declaration in the history book
			Story.HistoryBook.Add(new History() {
				Speaker = speaker,
				Listener = listener,
				Source = source,
				Predicate = predicate, 
				Value = value });

			SetSuspiciousness(speaker, source, predicate, listener);
			Story.ILikeWhatIHear = value / 3; // Flattery works

			// Change affiity based on agreement
			double before = Story.Affinity[listener, speaker];

			// Scale down the magnitude of flattery effect
//			double flattery = Story.Vain[listener] * (IntegerToBounded(value) -
//			                                          Story.PerceivedAffinity[listener, source, listener]) / 4;

			double flattery = Story.Vain[listener] * IntegerToBounded(value) / 4; // #4 07.20.13

			Story.Affinity[listener, speaker] = BSum (Story.Affinity[listener, speaker], 0.08 - flattery);

			if (Story.Debug)
			{
				flatteryDamage += Story.Affinity[listener, speaker] - before;
			}

//			Story.ILikeWhatIHear = (Story.AffinityLevels - BoundedToInteger(flattery)) / 3;
			Story.ILikeWhatIHear = (int)(3 - 10 * flattery);
		}

		private void DeclareAffinity(int value, int speaker, int listener, int predicate)
		{
			// Record the declaration in the history book
			Story.HistoryBook.Add(new History() {
				Speaker = speaker,
				Listener = listener,
				Source = speaker,
				Predicate = predicate, 
				Value = value });

			double bValue = IntegerToBounded(value);
			if (speaker == Story.Player)
			{
				Story.Affinity[speaker, predicate] = bValue;
				Story.PerceivedAffinity[speaker, speaker, predicate] = bValue;
			}

			SetSuspiciousness(speaker, speaker, predicate, listener);
//			double disagreement = (Math.Abs(bValue - Story.Affinity[listener, predicate])) / 4;
			double disagreement = (Math.Abs(bValue - Story.Affinity[listener, predicate])) / 4; // #5 07.20.13
			if (bValue > Story.Affinity[listener, predicate]) disagreement *= 0.75;

			// Change affinity based on agreement
			double before = Story.Affinity[listener, speaker];
			Story.Affinity[listener, speaker] = BSum(Story.Affinity[listener, speaker], 0.08 - disagreement);

			if (Story.Debug)
			{
				if (speaker == 0) Console.WriteLine("{0}  {1}  {2}", disagreement, before, Story.Affinity[listener, speaker]);
				flatteryDamage += Story.Affinity[listener, speaker] - before;
			}

//			Story.ILikeWhatIHear = (Story.AffinityLevels - BoundedToInteger(disagreement)) / 3;
			Story.ILikeWhatIHear = (int)(3 - 10 * disagreement);
		}

		private void SetSuspiciousness(int speaker, int source, int predicate, int listener)
		{
			List<History> pastTestimony = new List<History>();
			foreach (History h in Story.HistoryBook)
			{
				if (listener == h.Listener && source == h.Source && predicate == h.Predicate) pastTestimony.Add(h);
			}

			// There will always be at least one entry in pastTestimony
			double meanAffinity = Story.PerceivedAffinity[listener, source, predicate];
			double sumWeight = 1;
			foreach (History h in pastTestimony)
			{
				double trust = (Story.Affinity[listener, h.Speaker] + 1) / 2; // Make it unitary
				if (h.Speaker == h.Source) trust = BSum(trust, trust);
				sumWeight += trust;
				double x = IntegerToBounded(h.Value);
				meanAffinity += trust * x;
			}

			if (sumWeight > 0) meanAffinity /= sumWeight; // In difficulty level 2, it is possible for sumWeight to be zero

			History pt = pastTestimony[pastTestimony.Count - 1];
			double deviation = Math.Abs(BSum(meanAffinity, -IntegerToBounded(pt.Value)));

			// Apply gullibility
			deviation *= Story.DifficultyLevel * (1 - Story.Gullible[listener]) / 2;
			Story.Affinity[listener, pt.Speaker] = BSum(Story.Affinity[listener, pt.Speaker], -deviation);

//			// Calcuate the deviations from all previous statements on the
			double suspect = 0;
//			foreach (History h in pastTestimony)
//			{
//				double deviation = Math.Abs(meanAffinity - IntegerToBounded(h.Value));
//
//				// Apply gullibility
////				deviation *= 1 - Story.Gullible[listener];
//				deviation *= 1 - Story.Gullible[listener] + (Story.Gullible[listener] - 1) / (Story.DifficultyLevel + 1); // #1 07.20.13
//				suspect = deviation;
//				double before = Story.Affinity[listener, h.Speaker];
//				Story.Affinity[listener, h.Speaker] = BSum(Story.Affinity[listener, h.Speaker], 0.1 - deviation);
//
//				if (Story.Debug)
//				{
//					if (h.Speaker == 0)
//					{
//						Console.WriteLine("{0}  {1}  {2}  {3}  {4}  {5}", 
//						                  listener, 
//						                  deviation,
//						                  Story.PerceivedAffinity[listener, h.Source, h.Predicate],
//						                  IntegerToBounded(h.Value),
//						                  before,
//						                  Story.Affinity[listener, h.Speaker]);
//					}
//					suspectDamage = Story.Affinity[listener, h.Speaker] - before;
//				}
//			}
			suspect = (int)(10 * deviation);
			if (suspect > 2) suspect = 2;
			Story.PerceivedAffinity[listener, source, predicate] = meanAffinity;
		}

		private void CalculatePopularity() 
		{
			for (int i = 0; i < Story.Characters; ++i)
			{
				Story.Popularity[i, Story.Turn] = 0;
				for (int j = 0; j < Story.Characters; ++j)
				{
					if (j != i) 
					{
						Story.Popularity[i, Story.Turn] += Story.Affinity[j, i] / (Story.Characters - 1);
					}
				}
			}

			if (Story.Debug)
			{
				double grandSum = 0;
				for (int i = 0; i < Story.Characters; ++i)
				{
					for (int j = 0; j < Story.Characters; ++j)
					{
						grandSum += Story.Affinity[i, j] * Story.Affinity[i, j];
					}
				}
				Console.WriteLine("Grand Sum = {0} Flatter: {1} Suspicion: {2}",
				                  grandSum, flatteryDamage, suspectDamage);
			}
		}

		private void RunNPCTurn()
		{
			Story.SubPhase = 4;

			SelectCallee();
			SelectPredicate();

			if (Story.Callee == Story.Player)
			{
				Story.Phase = Story.NpcCallsPlayer;

				PostMessage(Story.Names[Story.Caller] + " is calling.");

				ClearAllHalos();
				ResetAllFaces();
				DrawHalo(GetCharacterView(Story.Caller), UIColor.White, true);
				DrawHalo(GetCharacterView(Story.Callee), UIColor.Blue, true);

				NSRunLoop.Current.RunUntil(NSRunLoopMode.Default, NSDate.Now);

				PlaySound(GetSound(Story.Caller, Story.SoundType.Ring));
			}
			else // Communicate affinity
			{
				Story.SubPhase = 0;
				PlaySound(Resources.psst);

				do {
					++Story.SubPhase;
					PlaySound(Resources.psst);

					int face;
					switch (Story.SubPhase) {
					case 0:
					case 2:
						face = (int)(Story.AffinityLevels * rand.NextDouble());
						DrawFace(GetCharacterView(Story.Caller), face);

						break;
					case 1:
					case 3:
						face = (int)(Story.AffinityLevels * rand.NextDouble());
						DrawFace(GetCharacterView(Story.Callee), face);

						break;
					}

					DeclareAffinity(BoundedToInteger(PlanDirectReport(Story.Caller, Story.Callee)), 
					                Story.Caller,
					                Story.Callee,
					                Story.Predicate);
					DeclareAffinity(BoundedToInteger(PlanDirectReport(Story.Callee, Story.Caller)), 
					                Story.Callee,
					                Story.Caller,
					                Story.Predicate);
					DeclareIndirectAffinity(BoundedToInteger(PlanIndirectReport(Story.Caller, Story.Callee)),
					                        Story.Predicate,
					                        Story.Caller,
					                        Story.Callee,
					                        Story.Callee);
					DeclareIndirectAffinity(BoundedToInteger(PlanIndirectReport(Story.Callee, Story.Caller)),
					                        Story.Predicate,
					                        Story.Callee,
					                        Story.Caller,
					                        Story.Caller);

				} while (Story.SubPhase != 4);

				NextPerson1();
			}
		}

		private double PlanDirectReport(int speaker, int listener)
		{
			// Decides what speaker will say to listener about predicate

			// These intermediate variables exist only for readability
			double trueValue = Story.Affinity[speaker, Story.Predicate];
			double lieValue = Story.PerceivedAffinity[speaker, listener, Story.Predicate];

			// I'm more honest to my friends
			double bias = BSum(Story.Dishonest[speaker], Story.Affinity[speaker, listener]);

			// Now adjust for difficulty level
			bias = BSum(bias, Story.DifficultyLevel / 4);

			// Tell 'em what they want to hear
			return Blend(trueValue, lieValue, bias);
		}

		private double PlanIndirectReport(int speaker, int listener)
		{
			// Decides what iSpeaker will say to listener about predicate's feelings for listener
			// Warning: This method is identical in form to the above but the array
			// indeces are different!

			// These intermediate variables exist only for readability
			double lieValue = Story.Affinity[speaker, listener];
			double trueValue = Story.PerceivedAffinity[speaker, Story.Predicate, listener];

			// My dishonesty is to make it sound as if the predicate shares my feelings
			// I'm more honset to my friends
			double bias = BSum(Story.Dishonest[speaker], -Story.Affinity[speaker, listener]);

			// Now adjust for difficulty level
			bias = BSum(bias, Story.DifficultyLevel / 4);

			// Tell 'em what they want to hear
			return Blend(trueValue, lieValue, bias);
		}

		private void NextPerson1()
		{
			Story.Callee = Story.Nobody;
			++Story.Caller;

			if (Story.Caller == Story.Characters)
			{
				Story.Caller = Story.Player;
				++Story.Turn;

				CalculatePopularity();
				Story.Phase = Story.PlayerSelectsCallee;
				Story.Selected = Story.Nobody;

				ResetAllFaces();

				if (Story.Turn == Story.MaxTurns) // End of game
				{
					Story.Phase = Story.Nobody;

					mainView.upArrow.RemoveFromSuperview();
					mainView.downArrow.RemoveFromSuperview();
					mainView.enter.RemoveFromSuperview();
					mainView.tips.RemoveFromSuperview();

					PostMessage("Game Over"); 

					Story.EndGame = true;
					mainView.SetNeedsDisplay();
					mainView.hexagon.SetNeedsDisplay(); // TODO: Need?

					NSRunLoop.Current.RunUntil(NSRunLoopMode.Default, NSDate.Now);
				}
			}
			else
			{
				RunNPCTurn();
			}
		}

		private void SelectCallee()
		{
			double bestFoM = 0;
			int bestCallee = Story.Nobody;

			for (int i = 0; i < Story.Characters; ++i)
			{
				if (i != Story.Caller)
				{
					double age = Math.Min(
						HowRecent(Story.Caller, i, Story.Anybody),
						HowRecent (i, Story.Caller, Story.Anybody)) + rand.NextDouble();
					double foM = age;

					if (HowRecent(Story.Caller, Story.Callee, i) < (Story.HistoryBook.Count + 1) && foM > bestFoM)
					{
						bestFoM = foM;
						bestCallee = i;
					}
				}
			}

			Story.Callee = bestCallee;
		}

		private void SelectPredicate()
		{
			double oldestCall = 0;
			int oldestPredicate = Story.Nobody;

			for (int i = 0; i < Story.Characters; ++i)
			{
				if (i != Story.Caller && i != Story.Callee)
				{
					// The random term allows random selection of otherwise equal candidates
					double age = Math.Min(
						HowRecent(Story.Caller, Story.Callee, i),
						HowRecent(Story.Callee, Story.Caller, i)) + rand.NextDouble();
					if (age > oldestCall)
					{
						oldestCall = age;
						oldestPredicate = i;
					}
				}
			}
			Story.Predicate = oldestPredicate;
		}

		private double HowRecent(int speaker, int listener, int predicate)
		{
			bool speakerHit;
			bool listenerHit;
			bool predicateHit;
			bool trifecta;
			int i = Story.HistoryBook.Count;

			do {
				--i;
				History theEvent = Story.HistoryBook[i];

				speakerHit = (speaker == theEvent.Speaker);
				listenerHit = (listener == theEvent.Listener);
				predicateHit = (predicate == theEvent.Predicate || predicate == Story.Anybody);
				trifecta = (speakerHit && listenerHit && predicateHit);
			} while (i > 0 && !trifecta);

			return Story.HistoryBook.Count  - i;
		}

		private double IntegerToBounded(int tInteger)
		{
			double affinity = (2 * (double)tInteger / Story.AffinityLevels) - 1;

			// Snip off extreme values
			if (affinity == -1) affinity = -0.98;
			if (affinity == 1) affinity = 0.98;

			return affinity;
		}

		internal int BoundedToInteger(double tBounded)
		{
			int statement = (int)(Story.AffinityLevels * (1 + tBounded) / 2);
			return statement;
		}

		private void PrintTurnStats()
		{
			// For debugging purposes only
			double aveDeviance = 0;
			double aveWeight = 0;
			double aveAffinity = 0;

			for (int i = 0; i < Story.Characters; ++i)
			{
				for (int j = 0; j < Story.Characters; ++j)
				{
					if (i != j)
					{
						aveAffinity += Story.Affinity[i, j] / 30;
						for (int k = 0; k < Story.Characters; ++k)
						{
							if (k != j) aveDeviance += Math.Pow(Story.PerceivedAffinity[i, j, k] - 
							                                    Story.Affinity[j, k], 2) / 150;
						}
					}
				}
			}
			Console.WriteLine("AveDeviance: {0} AveWeight: {1} AveAffinity: {2} Aff: {3}",
			                  aveDeviance, aveWeight, aveAffinity, Story.Affinity[3, 0]);
		}
	}
}


