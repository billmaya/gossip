using System;
using System.Drawing;
using MonoTouch.CoreGraphics;
using MonoTouch.Foundation;
using MonoTouch.UIKit;

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
				uiButtonImages[0] = Resources.leftArrowEnabled.Scale(new SizeF(64.0f, 64.0f));
				uiButtonImages[1] = Resources.leftArrowPressed.Scale(new SizeF(64.0f, 64.0f)); 
				uiButtonImages[2] = Resources.leftArrowDisabled.Scale(new SizeF(64.0f, 64.0f)); 
			} 

			dimensions = new SizeF(uiButtonImages[0].Size.Width, uiButtonImages[0].Size.Height);
			location = new PointF(5f, UIScreen.MainScreen.Bounds.Width - (dimensions.Width + 20f));
			ModifyFrame();
		}

		public override void Draw(RectangleF rect)
		{
			base.Draw(rect);

			using (gctx = UIGraphics.GetCurrentContext()) 
			{
				if (pressed) uiButtonImages[1].Draw(new PointF(0f, 0f));
				else uiButtonImages[0].Draw (new PointF(0f, 0f));
			}
		}

		public override void TouchesBegan (NSSet touches, UIEvent evt)
		{
			base.TouchesBegan (touches, evt);

			this.pressed = true;
			this.SetNeedsDisplay();
		}

		public override void TouchesEnded (MonoTouch.Foundation.NSSet touches, MonoTouch.UIKit.UIEvent evt)
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

