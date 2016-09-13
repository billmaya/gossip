using System;
using CoreGraphics;
using Foundation;
using UIKit;

namespace Gossip
{
	[Register("LeftArrowHelpView")]
	public class LeftArrowHelpView : ButtonView
	{
		public LeftArrowHelpView()
		{
			if (UIDevice.CurrentDevice.UserInterfaceIdiom == UIUserInterfaceIdiom.Pad)
			{
				uiButtonImages[0] = Resources.leftArrowEnabled;
				uiButtonImages[1] = Resources.leftArrowPressed;
				uiButtonImages[2] = Resources.leftArrowDisabled;
			}
			else 
			{
				uiButtonImages[0] = Resources.leftArrowEnabled.Scale(new CGSize(64.0f, 64.0f));
				uiButtonImages[1] = Resources.leftArrowPressed.Scale(new CGSize(64.0f, 64.0f)); 
				uiButtonImages[2] = Resources.leftArrowDisabled.Scale(new CGSize(64.0f, 64.0f)); 
			} 

			dimensions = new CGSize(uiButtonImages[0].Size.Width, uiButtonImages[0].Size.Height);
			location = new CGPoint(5f, UIScreen.MainScreen.Bounds.Height - (dimensions.Width + 20f));
			ModifyFrame();
		}

		public override void Draw(CGRect rect)
		{
			base.Draw(rect);

			using (gctx = UIGraphics.GetCurrentContext()) 
			{
				if (pressed) uiButtonImages[1].Draw(new CGPoint(0f, 0f));
				else uiButtonImages[0].Draw (new CGPoint(0f, 0f));
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

			int currentIndex = ((HelpView)this.Superview).index;

			if (currentIndex == 0) ((HelpView)this.Superview).hvc.ShowMainScreen();
			else ((HelpView)this.Superview).index = --currentIndex;

			((HelpView)this.Superview).SetNeedsDisplay();
		}
	}
}

