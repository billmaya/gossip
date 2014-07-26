using System;
using System.Drawing;
using MonoTouch.CoreGraphics;
using MonoTouch.Foundation;
using MonoTouch.UIKit;

namespace Gossip
{
	[Register("StoreButtonView")]
	public class StoreButtonView : ButtonView
	{
		public StoreButtonView()
		{
			if (UIDevice.CurrentDevice.UserInterfaceIdiom == UIUserInterfaceIdiom.Pad)
			{
				uiButtonImages[0] = Resources.storeEnabled;
				uiButtonImages[1] = Resources.storePressed;
				uiButtonImages[2] = Resources.storeDisabled;
			}
			else 
			{
				uiButtonImages[0] = Resources.storeEnabled.Scale(new SizeF(64.0f, 64.0f));
				uiButtonImages[1] = Resources.storePressed.Scale(new SizeF(64.0f, 64.0f));
				uiButtonImages[2] = Resources.storeDisabled.Scale(new SizeF(64.0f, 64.0f));
			}

			dimensions = new SizeF(uiButtonImages[0].Size.Width, uiButtonImages[0].Size.Height);
			location = new PointF(UIScreen.MainScreen.Bounds.Height - (dimensions.Width + 20f), 5);

			ModifyFrame();

			if (Story.Free)
				this.disabled = false;
			else
				this.disabled = true;
		}

		public override void Draw(RectangleF rect)
		{
			base.Draw(rect);

			using (gctx = UIGraphics.GetCurrentContext ()) 
			{
				if (this.pressed) uiButtonImages[1].Draw(new PointF(0f, 0f));
				else if (this.disabled) uiButtonImages[2].Draw(new PointF(0f, 0f));
				else uiButtonImages[0].Draw (new PointF(0f, 0f));
			}
		}

		public override void TouchesBegan(NSSet touches, UIEvent evt)
		{
			base.TouchesBegan(touches, evt);

			this.pressed = true;
			this.SetNeedsDisplay();
		}
	}
}

