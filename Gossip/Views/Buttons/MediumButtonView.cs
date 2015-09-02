using System;
using System.Drawing;
using MonoTouch.CoreGraphics;
using MonoTouch.Foundation;
using MonoTouch.UIKit;

namespace Gossip
{
	[Register("MediumButtonView")]
	public class MediumButtonView : ButtonView
	{
		public MediumButtonView ()
		{
			if (UIDevice.CurrentDevice.UserInterfaceIdiom == UIUserInterfaceIdiom.Pad)
			{
				uiButtonImages[0] = Resources.mediumButtonNotPressed;
				uiButtonImages[1] = Resources.mediumButtonPressed;
				uiButtonImages[2] = Resources.mediumButtonDisabled;

				// HACK:
				dimensions = new SizeF(uiButtonImages[0].Size.Width, uiButtonImages[0].Size.Height);
				location = new PointF(UIScreen.MainScreen.FixedCoordinateSpace.Bounds.GetMidY() - (dimensions.Width / 2f) - Story.OptionOffset,
					UIScreen.MainScreen.FixedCoordinateSpace.Bounds.Width - (dimensions.Height + 80f));
			}
			else 
			{
				uiButtonImages[0] = Resources.mediumButtonNotPressed.Scale(new SizeF(64.0f, 64.0f));
				uiButtonImages[1] = Resources.mediumButtonPressed.Scale(new SizeF(64.0f, 64.0f)); 
				uiButtonImages[2] = Resources.mediumButtonDisabled.Scale(new SizeF(64.0f, 64.0f));

				// HACK:
				dimensions = new SizeF(uiButtonImages[0].Size.Width, uiButtonImages[0].Size.Height);
				location = new PointF(UIScreen.MainScreen.FixedCoordinateSpace.Bounds.GetMidY() - (dimensions.Width / 2f) - Story.OptionOffset,
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
				Story.DifficultyLevel = 1;

				((OptionsView)this.Superview).easyButton.Pressed = false;
				this.pressed = true;
				((OptionsView)this.Superview).hardButton.Pressed = false;

				((OptionsView)this.Superview).easyButton.SetNeedsDisplay();
				this.SetNeedsDisplay();
				((OptionsView)this.Superview).hardButton.SetNeedsDisplay();
			}
		}
	}
}

