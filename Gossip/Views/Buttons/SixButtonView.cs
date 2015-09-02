using System;
using System.Drawing;
using MonoTouch.CoreGraphics;
using MonoTouch.Foundation;
using MonoTouch.UIKit;

namespace Gossip
{
	[Register("SixButtonView")]
	public class SixButtonView : ButtonView
	{
		public SixButtonView ()
		{
			if (UIDevice.CurrentDevice.UserInterfaceIdiom == UIUserInterfaceIdiom.Pad)
			{
				uiButtonImages[0] = Resources.sixButtonNotPressed;
				uiButtonImages[1] = Resources.sixButtonPressed;
				uiButtonImages[2] = Resources.sixButtonDisabled;

				// HACK: Eventually combine with 28-30 and move to 33-35
				dimensions = new SizeF(uiButtonImages[0].Size.Width, uiButtonImages[0].Size.Height);
				location = new PointF (((UIScreen.MainScreen.FixedCoordinateSpace.Bounds.Height / 4f) * 3f) - (dimensions.Width / 2f) - Story.OptionOffset, 175f);
			}
			else 
			{
				uiButtonImages[0] = Resources.sixButtonNotPressed.Scale(new SizeF(64.0f, 64.0f));
				uiButtonImages[1] = Resources.sixButtonPressed.Scale(new SizeF(64.0f, 64.0f)); 
				uiButtonImages[2] = Resources.sixButtonDisabled.Scale(new SizeF(64.0f, 64.0f));

				// HACK: Eventually combine with 28-30 and move to 33-35
				dimensions = new SizeF(uiButtonImages[0].Size.Width, uiButtonImages[0].Size.Height);
				location = new PointF(((UIScreen.MainScreen.FixedCoordinateSpace.Bounds.Height / 4f) * 3f) - (dimensions.Width / 2f) - Story.OptionOffset, 
					UIScreen.MainScreen.FixedCoordinateSpace.Bounds.Width / 5.5f);
			}

			ModifyFrame();

			if (Story.Free) 
				this.disabled = true;
		}

		public override void Draw (RectangleF rect)
		{
			base.Draw (rect);

			using (gctx = UIGraphics.GetCurrentContext ()) 
			{
				if (this.pressed)
					uiButtonImages[1].Draw(new PointF(0f, 0f));
				else if (this.disabled)
					uiButtonImages[2].Draw(new PointF(0f, 0f));
				else uiButtonImages[0].Draw (new PointF(0f, 0f));
			}
		}


		public override void TouchesEnded (MonoTouch.Foundation.NSSet touches, MonoTouch.UIKit.UIEvent evt)
		{
			base.TouchesEnded (touches, evt);

			if (this.disabled)
				return;

			if (this.Pressed == false) 
			{
				Story.Characters = 6;

				((OptionsView)this.Superview).fourButton.pressed = false;
				((OptionsView)this.Superview).fiveButton.pressed = false;
				this.pressed = true;

				((OptionsView)this.Superview).fourButton.SetNeedsDisplay();
				((OptionsView)this.Superview).fiveButton.SetNeedsDisplay();
				this.SetNeedsDisplay();
			}
		}
	}
}

