using System;
using System.Drawing;
using MonoTouch.CoreGraphics;
using MonoTouch.Foundation;
using MonoTouch.UIKit;

namespace Gossip
{
	[Register("TipsButtonView")]
	public class TipsButtonView : ButtonView
	{
		public MainViewController mvc { get; set; }

		public TipsButtonView ()
		{
			if (UIDevice.CurrentDevice.UserInterfaceIdiom == UIUserInterfaceIdiom.Pad)
			{
				uiButtonImages[0] = Resources.tipsEnabled;
				uiButtonImages[1] = Resources.tipsPressed;
				uiButtonImages[2] = Resources.tipsDisabled;
			}
			else 
			{
				uiButtonImages[0] = Resources.tipsEnabled.Scale(new SizeF(64.0f, 64.0f));
				uiButtonImages[1] = Resources.tipsPressed.Scale(new SizeF(64.0f, 64.0f));
				uiButtonImages[2] = Resources.tipsDisabled.Scale(new SizeF(64.0f, 64.0f)); 
			}

			dimensions = new SizeF(uiButtonImages[0].Size.Width, uiButtonImages[0].Size.Height);
//			location = new PointF(5f, UIScreen.MainScreen.Bounds.Width - (dimensions.Width + 20f));
			location = new PointF(5f, dimensions.Width + 12f);
			ModifyFrame();
		}

		public override void Draw (RectangleF rect)
		{
			base.Draw (rect);

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

			((MainView)this.Superview).mvc.ShowTipsScreen();
		}
	}
}

