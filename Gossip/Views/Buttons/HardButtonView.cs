using System;
using CoreGraphics;
using Foundation;
using UIKit;

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
				dimensions = new CGSize(uiButtonImages[0].Size.Width, uiButtonImages[0].Size.Height);
				location = new CGPoint(((UIScreen.MainScreen.FixedCoordinateSpace.Bounds.Height / 4f) * 3f) - (dimensions.Width / 2f) - Story.OptionOffset,
					UIScreen.MainScreen.FixedCoordinateSpace.Bounds.Width - (dimensions.Height + 80f));
			}
			else 
			{
				uiButtonImages[0] = Resources.hardButtonNotPressed.Scale(new CGSize(64.0f, 64.0f));
				uiButtonImages[1] = Resources.hardButtonPressed.Scale(new CGSize(64.0f, 64.0f));
				uiButtonImages[2] = Resources.hardButtonDisabled.Scale(new CGSize(64.0f, 64.0f));

				// HACK:
				dimensions = new CGSize(uiButtonImages[0].Size.Width, uiButtonImages[0].Size.Height);
				location = new CGPoint(((UIScreen.MainScreen.FixedCoordinateSpace.Bounds.Height / 4f) * 3f) - (dimensions.Width / 2f) - Story.OptionOffset,
					UIScreen.MainScreen.FixedCoordinateSpace.Bounds.Width - (dimensions.Height + 20f));
			}

			ModifyFrame();

			if (Story.Free)
				this.disabled = true;
		}

		public override void Draw (CGRect rect)
		{
			base.Draw (rect);

			using (gctx = UIGraphics.GetCurrentContext ()) 
			{
				if (this.pressed) 
					uiButtonImages[1].Draw(new CGPoint(0f, 0f));
				else if (this.disabled)
					uiButtonImages[2].Draw(new CGPoint(0f, 0f));
				else 
					uiButtonImages[0].Draw (new CGPoint(0f, 0f));
			}
		}

		public override void TouchesEnded (NSSet touches, UIEvent evt)
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

