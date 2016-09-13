using System;
using CoreGraphics;
using Foundation;
using UIKit;

namespace Gossip
{
	[Register("PlayAgainButtonView")]
	public class PlayAgainButtonView : ButtonView
	{
		public MainViewController mvc { get; set; }

		public PlayAgainButtonView()
		{
			if (UIDevice.CurrentDevice.UserInterfaceIdiom == UIUserInterfaceIdiom.Pad)
			{
				uiButtonImages[0] = Resources.playAgainEnabled;
				uiButtonImages[1] = Resources.playAgainPressed;
				uiButtonImages[2] = Resources.playAgainDisabled;
			}
			else 
			{
				uiButtonImages[0] = Resources.playAgainEnabled.Scale(new CGSize(64.0f, 64.0f));
				uiButtonImages[1] = Resources.playAgainPressed.Scale(new CGSize(64.0f, 64.0f));
				uiButtonImages[2] = Resources.playAgainDisabled.Scale(new CGSize(64.0f, 64.0f)); 
			}

			dimensions = new CGSize(uiButtonImages[0].Size.Width, uiButtonImages[0].Size.Height);
			location = new CGPoint(5f, UIScreen.MainScreen.Bounds.Height - (dimensions.Width + 20f));
			ModifyFrame();
		}

		public override void Draw(CGRect rect)
		{
			base.Draw(rect);

			using (gctx = UIGraphics.GetCurrentContext ()) 
			{
				if (this.enabled) {
					if (this.pressed)
						uiButtonImages[1].Draw(new CGPoint(0f, 0f));
					else
						uiButtonImages[0].Draw(new CGPoint(0f, 0f));
				}
				else uiButtonImages[2].Draw (new CGPoint(0f, 0f));
			}
		}

		public override void TouchesBegan(NSSet touches, UIEvent evt)
		{
			base.TouchesBegan(touches, evt);

			this.pressed = true;
			this.SetNeedsDisplay();
		}

		public override void TouchesEnded(NSSet touches, UIEvent evt)
		{
			base.TouchesEnded(touches, evt);

			this.pressed = false;
			this.SetNeedsDisplay();

			Story.EndGame = false;
			Story.Restart = true;

//			((MainView)this.Superview).SetNeedsDisplay();
//			((MainView)this.Superview).mvc.InitializeGame();

			((MainView)this.Superview).mvc.RestartGame();
		}
	}
}

