using System;
using CoreGraphics;
using Foundation;
using UIKit;

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
				uiButtonImages[0] = Resources.storeEnabled.Scale(new CGSize(64.0f, 64.0f));
				uiButtonImages[1] = Resources.storePressed.Scale(new CGSize(64.0f, 64.0f));
				uiButtonImages[2] = Resources.storeDisabled.Scale(new CGSize(64.0f, 64.0f));
			}

			dimensions = new CGSize(uiButtonImages[0].Size.Width, uiButtonImages[0].Size.Height);
			location = new CGPoint(UIScreen.MainScreen.Bounds.Height - (dimensions.Width + 20f), 5);

			ModifyFrame();

			if (Story.Free)
				this.disabled = false;
			else
				this.disabled = true;
		}

		public override void Draw(CGRect rect)
		{
			base.Draw(rect);

			using (gctx = UIGraphics.GetCurrentContext ()) 
			{
				if (this.pressed) uiButtonImages[1].Draw(new CGPoint(0f, 0f));
				else if (this.disabled) uiButtonImages[2].Draw(new CGPoint(0f, 0f));
				else uiButtonImages[0].Draw (new CGPoint(0f, 0f));
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

