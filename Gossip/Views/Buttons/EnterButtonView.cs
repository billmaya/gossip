using System;
using CoreGraphics;
using Foundation;
using UIKit;

namespace Gossip
{
	[Register("EnterButtonView")]
	public class EnterButtonView : ButtonView
	{
		public MainViewController mvc { get; set; }

		public EnterButtonView ()
		{
//			State = 0;

			if (UIDevice.CurrentDevice.UserInterfaceIdiom == UIUserInterfaceIdiom.Pad)
			{
				uiButtonImages[0] = Resources.enterEnabled;
				uiButtonImages[1] = Resources.enterPressed;
				uiButtonImages[2] = Resources.enterDisabled;
			}
			else 
			{
				uiButtonImages[0] = Resources.enterEnabled.Scale(new CGSize(64.0f, 64.0f));
				uiButtonImages[1] = Resources.enterPressed.Scale(new CGSize(64.0f, 64.0f));
				uiButtonImages[2] = Resources.enterDisabled.Scale(new CGSize(64.0f, 64.0f)); 
			} 

			dimensions = new CGSize(uiButtonImages[0].Size.Width, uiButtonImages[0].Size.Height);
			location = new CGPoint(UIScreen.MainScreen.Bounds.Width - (dimensions.Width + 5), UIScreen.MainScreen.Bounds.Height - (dimensions.Width + 20));
			ModifyFrame();
		}

		public override void Draw (CGRect rect)
		{
			base.Draw (rect);

			using (gctx = UIGraphics.GetCurrentContext ()) 
			{
//				if (this.enabled) uiButtonImages[0].Draw(new PointF(0f, 0f));
//				else uiButtonImages[2].Draw (new PointF(0f, 0f));

				if (this.enabled) {
					if (this.pressed)
						uiButtonImages[1].Draw(new CGPoint(0f, 0f));
					else
						uiButtonImages[0].Draw(new CGPoint(0f, 0f));
				}
				else uiButtonImages[2].Draw (new CGPoint(0f, 0f));
			}
		}

		public override void TouchesBegan (NSSet touches, UIEvent evt)
		{
			base.TouchesBegan (touches, evt);

			this.pressed = true;
			this.SetNeedsDisplay();
		}

		public override void TouchesEnded (NSSet touches, UIEvent evt)
		{
			base.TouchesEnded (touches, evt);

			this.pressed = false;
			this.SetNeedsDisplay();

			Story.Selected = (int)Story.Button.Enter;
		}
	}
}

