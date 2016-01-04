using System;
using System.Drawing;
using MonoTouch.CoreGraphics;
using MonoTouch.Foundation;
using MonoTouch.UIKit;

namespace Gossip
{
	[Register("RightArrowHelpView")]
	public class RightArrowHelpView : ButtonView
	{
		public RightArrowHelpView()
		{
			if (UIDevice.CurrentDevice.UserInterfaceIdiom == UIUserInterfaceIdiom.Pad)
			{
				uiButtonImages[0] = Resources.rightArrowEnabled;
				uiButtonImages[1] = Resources.rightArrowPressed;
				uiButtonImages[2] = Resources.rightArrowDisabled;
			}
			else 
			{
				uiButtonImages[0] = Resources.rightArrowEnabled.Scale(new SizeF(64.0f, 64.0f));
				uiButtonImages[1] = Resources.rightArrowPressed.Scale(new SizeF(64.0f, 64.0f)); 
				uiButtonImages[2] = Resources.rightArrowDisabled.Scale(new SizeF(64.0f, 64.0f)); 
			} 

			dimensions = new SizeF(uiButtonImages[0].Size.Width, uiButtonImages[0].Size.Height);
			location = new PointF(UIScreen.MainScreen.Bounds.Width - (dimensions.Width + 5), UIScreen.MainScreen.Bounds.Height - (dimensions.Width + 20));
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

			if (currentIndex == Story.Characters) //6) 
			{
				currentIndex = 0; 
				((HelpView)this.Superview).index = currentIndex;
			} else 
			{
				((HelpView)this.Superview).index = ++currentIndex;
			}

			((HelpView)this.Superview).SetNeedsDisplay();
		}
	}
}

