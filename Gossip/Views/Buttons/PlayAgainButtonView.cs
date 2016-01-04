using System;
using System.Drawing;
using MonoTouch.CoreGraphics;
using MonoTouch.Foundation;
using MonoTouch.UIKit;

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
				uiButtonImages[0] = Resources.playAgainEnabled.Scale(new SizeF(64.0f, 64.0f));
				uiButtonImages[1] = Resources.playAgainPressed.Scale(new SizeF(64.0f, 64.0f));
				uiButtonImages[2] = Resources.playAgainDisabled.Scale(new SizeF(64.0f, 64.0f)); 
			}

			dimensions = new SizeF(uiButtonImages[0].Size.Width, uiButtonImages[0].Size.Height);
			location = new PointF(5f, UIScreen.MainScreen.Bounds.Height - (dimensions.Width + 20f));
			ModifyFrame();
		}

		public override void Draw(RectangleF rect)
		{
			base.Draw(rect);

			using (gctx = UIGraphics.GetCurrentContext ()) 
			{
				if (this.enabled) {
					if (this.pressed)
						uiButtonImages[1].Draw(new PointF(0f, 0f));
					else
						uiButtonImages[0].Draw(new PointF(0f, 0f));
				}
				else uiButtonImages[2].Draw (new PointF(0f, 0f));
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

