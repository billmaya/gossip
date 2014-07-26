using System;
using System.Drawing;
using MonoTouch.CoreGraphics;
using MonoTouch.Foundation;
using MonoTouch.UIKit;

namespace Gossip
{
	[Register("MainView")]
	public class MainView : UIView
	{
		internal HexagonView hexagon = new HexagonView();

		internal BaraView bara = new BaraView();
		internal EllaView ella = new EllaView();
		internal MaxView max = new MaxView();
		internal OwenView owen = new OwenView();
		internal MortView mort = new MortView();
		internal ZoeView zoe = new ZoeView();

		internal UpArrowButtonView upArrow = new UpArrowButtonView();
		internal DownArrowButtonView downArrow = new DownArrowButtonView();
		internal EnterButtonView enter = new EnterButtonView();
		internal RulesButtonView rules = new RulesButtonView();
		internal TipsButtonView tips = new TipsButtonView();

		internal PlayAgainButtonView playAgain = new PlayAgainButtonView();

		internal MessageView message = new MessageView();
		internal TurnView turn = new TurnView();

		internal PhaseView phase = new PhaseView ();

		public MainViewController mvc { get; set; }

		public MainView (IntPtr p) : base(p)
		{
		}

		public override void Draw (RectangleF rect)
		{
			base.Draw (rect);

			using (CGContext gctx = UIGraphics.GetCurrentContext ()) {
				
				gctx.SetFillColor(UIColor.Black.CGColor);
				gctx.FillRect(new RectangleF(0, 0, UIScreen.MainScreen.Bounds.Height, UIScreen.MainScreen.Bounds.Width));
			}

			RemoveAllSubViews();

			this.AddSubview(hexagon);
			hexagon.SetNeedsDisplay();

			this.AddSubview(bara);
			bara.Affinity = 4;

			this.AddSubview(owen);
			owen.Affinity = 4;

			this.AddSubview(max);
			max.Affinity = 4;

			this.AddSubview(ella);
			ella.Affinity = 4;

			if (Story.Characters >= 5)
			{
				this.AddSubview(mort);
				mort.Affinity = 4;
			} 

			if (Story.Characters == 6)
			{
				this.AddSubview(zoe);
				zoe.Affinity = 4;
			}

			if (!Story.EndGame)
			{
				this.AddSubview(upArrow);
				upArrow.SetNeedsDisplay();

				this.AddSubview(downArrow);
				downArrow.SetNeedsDisplay();

				this.AddSubview(enter);
				enter.SetNeedsDisplay();

				this.AddSubview(tips);
				tips.SetNeedsDisplay();

				this.AddSubview(rules);
				rules.SetNeedsDisplay();

				this.AddSubview(playAgain);
				playAgain.Enabled = true;
				playAgain.SetNeedsDisplay();
			}

			this.AddSubview(message);

			this.AddSubview(turn);

			DrawNames();

			if (Story.EndGame) 
			{
//				this.AddSubview(playAgain);
//				playAgain.Enabled = true;
//				playAgain.SetNeedsDisplay();

				DrawCharacterRanking();
			}

			// Test for end game rank placement
//			for (int i = 0; i < Story.MaxCharacters; ++i) {
//				DrawCharacterRanking(i, "Fourth");
//			}
//
			if (Story.Debug)
			{
				this.AddSubview(phase);
				phase.SetNeedsDisplay();
			}
		}

		internal void DrawNames()
		{
			using (CGContext gctx = UIGraphics.GetCurrentContext())
			{
				int rightXOffset, leftXOffset, yOffset;

				gctx.SetFillColor(UIColor.White.CGColor);
				gctx.SetTextDrawingMode(CGTextDrawingMode.Fill);

				if (UIDevice.CurrentDevice.UserInterfaceIdiom == UIUserInterfaceIdiom.Pad)
				{
					gctx.SelectFont("Arial", 36f, CGTextEncoding.MacRoman);
					rightXOffset = 140;
					leftXOffset = 80;
					yOffset = 30;
				}
				else
				{
					gctx.SelectFont("Arial", 24f, CGTextEncoding.MacRoman);
					rightXOffset = 70;
					leftXOffset = 55;
					yOffset = 5;
				}

				gctx.TranslateCTM(0, this.Frame.Width);
				gctx.ScaleCTM(1, -1);

				string name;
				float nameX, nameY;

				for (int i = 0; i < Story.Characters; ++i)
				{
					if (i == 0 || i == 1 | i == 5) nameX = Story.CharacterLocations[i, 0] + rightXOffset;
					else nameX = Story.CharacterLocations[i, 0] - leftXOffset;

					if (i == 1) nameY = Story.CharacterLocations[5, 1];
					else if (i == 2) nameY = Story.CharacterLocations[4, 1];
					else if (i == 4) nameY = Story.CharacterLocations[2, 1];
					else if (i == 5) nameY = Story.CharacterLocations[1, 1];
					else nameY = Story.CharacterLocations[i, 1];
			
					nameY = nameY + yOffset;

					if (i == Story.Player) name = "You";
					else name = Story.Names[i];

					gctx.ShowTextAtPoint(nameX, nameY, name);

				}
			}
		}

		internal void DrawCharacterRanking()
		{
			int[] winnerList = new int[Story.Characters];
			double[] winnerScore = new double[Story.Characters];

			for (int i = 0; i < Story.Characters; ++i) {
				winnerList[i] = i;
				winnerScore[i] = Story.Popularity[i, Story.Turn] - Story.Popularity[i, 0];
			}

			for (int i = 1; i < Story.Characters; ++i) {
				int j = i;
				bool atTheTop = false;

				while (!atTheTop) {
					if (winnerScore[j] > winnerScore[j - 1]) {
						int tempList = winnerList[j - 1];
						double tempScore = winnerScore[j - 1];

						winnerList[j - 1] = winnerList[j];
						winnerScore[j - 1] = winnerScore[j];
						winnerList[j] = tempList;
						winnerScore[j] = tempScore;
					}
					--j;
					atTheTop = (j == 0);
				}
			}

			for (int i = 0; i < Story.Characters; ++i) {
				int affinity = this.mvc.BoundedToInteger(this.mvc.BSum(Story.Popularity[winnerList[i], Story.Turn], -Story.Popularity[winnerList[i], 0]));
				this.mvc.DrawHalo(this.mvc.GetCharacterView(winnerList[i]), Story.AffinityLevelColor[affinity], true);

				string place = string.Empty;
				switch (i) {
					case 0:
					place = "First!"; 
					break;
					case 1:
					place = "Second";
					break;
					case 2:
					place = "Third";
					break;
					case 3:
					place = "Fourth";
					break;
					case 4:
					place = "Fifth";
					break;
					case 5:
					place = "Last";
					break;
				}

				DrawCharacterRanking(winnerList[i], place);
			}
		}

		internal void DrawCharacterRanking(int character, string place)
		{
			using (CGContext gctx = UIGraphics.GetCurrentContext())
			{
				int rightXOffset, leftXOffset, yOffset;

				gctx.SetFillColor(UIColor.Yellow.CGColor);
				gctx.SetTextDrawingMode(CGTextDrawingMode.Fill);

				if (UIDevice.CurrentDevice.UserInterfaceIdiom == UIUserInterfaceIdiom.Pad)
				{
					gctx.SelectFont("Arial", 36f, CGTextEncoding.MacRoman);
					rightXOffset = 140;
					leftXOffset = 120; //80;
					yOffset = 60; //30;
				}
				else
				{
					gctx.SelectFont("Arial", 24f, CGTextEncoding.MacRoman);
					rightXOffset = 70;
					leftXOffset = 80;//95; //55;
					yOffset = 25;//10; //5;
				}

				gctx.SaveState();

				gctx.TranslateCTM(0, this.Frame.Width);
				gctx.ScaleCTM(1, -1);

				gctx.RestoreState();

				float nameX, nameY;

				if (character == 0 || character == 1 | character == 5) nameX = Story.CharacterLocations[character, 0] + rightXOffset;
				else nameX = Story.CharacterLocations[character, 0] - leftXOffset;

				if (character == 1) nameY = Story.CharacterLocations[5, 1];
				else if (character == 2) nameY = Story.CharacterLocations[4, 1];
				else if (character == 4) nameY = Story.CharacterLocations[2, 1];
				else if (character == 5) nameY = Story.CharacterLocations[1, 1];
				else nameY = Story.CharacterLocations[character, 1];

				nameY = nameY + yOffset;

				gctx.ShowTextAtPoint(nameX, nameY, place);
			}
		}

		internal void RemoveAllSubViews()
		{
			hexagon.RemoveFromSuperview();
			bara.RemoveFromSuperview();
			owen.RemoveFromSuperview();
			max.RemoveFromSuperview();
			ella.RemoveFromSuperview();
			mort.RemoveFromSuperview();
			zoe.RemoveFromSuperview();
		}
	}
}

