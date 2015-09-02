using System;
using System.Drawing;
using MonoTouch.CoreGraphics;
using MonoTouch.Foundation;
using MonoTouch.UIKit;

namespace Gossip
{
	[Register("HardButtonView")]
	public class HardButtonView : ButtonView
	{
		public HardButtonView ()
		{
			if (UIDevice.CurrentDevice.UserInterfaceIdiom == UIUserInterfaceIdiom.Pad)
			{
				uiButtonImages[0] = Resources.hardButtonNotPressed;
				uiButtonImages[1] = Resources.hardButtonPressed;
				uiButtonImages[2] = Resources.hardButtonDisabled;

				// HACK:
				dimensions = new SizeF(uiButtonImages[0].Size.Width, uiButtonImages[0].Size.Height);
				location = new PointF(((UIScreen.MainScreen.FixedCoordinateSpace.Bounds.Height / 4f) * 3f) - (dimensions.Width / 2f) - Story.OptionOffset,
					UIScreen.MainScreen.FixedCoordinateSpace.Bounds.Width - (dimensions.Height + 80f));
			}
			else 
			{
				uiButtonImages[0] = Resources.hardButtonNotPressed.Scale(new SizeF(64.0f, 64.0f));
				uiButtonImages[1] = Resources.hardButtonPressed.Scale(new SizeF(64.0f, 64.0f));
				uiButtonImages[2] = Resources.hardButtonDisabled.Scale(new SizeF(64.0f, 64.0f));

				// HACK:
				dimensions = new SizeF(uiButtonImages[0].Size.Width, uiButtonImages[0].Size.Height);
				location = new PointF(((UIScreen.MainScreen.FixedCoordinateSpace.Bounds.Height / 4f) * 3f) - (dimensions.Width / 2f) - Story.OptionOffset,
					UIScreen.MainScreen.FixedCoordinateSpace.Bounds.Width - (dimensions.Height + 20f));
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
				else 
					uiButtonImages[0].Draw (new PointF(0f, 0f));
			}
		}

		public override void TouchesEnded (MonoTouch.Foundation.NSSet touches, MonoTouch.UIKit.UIEvent evt)
		{
			base.TouchesEnded (touches, evt);

			if (this.disabled)
				return;

			if (this.pressed == false) 
			{
				Story.DifficultyLevel = 2;

				((OptionsView)this.Superview).easyButton.Pressed = false;
				((OptionsView)this.Superview).mediumButton.Pressed = false;
				this.pressed = true;

				((OptionsView)this.Superview).easyButton.SetNeedsDisplay();
				((OptionsView)this.Superview).mediumButton.SetNeedsDisplay();
				this.SetNeedsDisplay();
			}
		}
	}
}

