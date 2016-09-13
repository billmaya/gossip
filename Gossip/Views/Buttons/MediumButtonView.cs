using System;
using CoreGraphics;
using CoreGraphics;
using Foundation;
using UIKit;

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
				dimensions = new CGSize(uiButtonImages[0].Size.Width, uiButtonImages[0].Size.Height);
				location = new CGPoint(UIScreen.MainScreen.FixedCoordinateSpace.Bounds.GetMidY() - (dimensions.Width / 2f) - Story.OptionOffset,
					UIScreen.MainScreen.FixedCoordinateSpace.Bounds.Width - (dimensions.Height + 80f));
			}
			else 
			{
				uiButtonImages[0] = Resources.mediumButtonNotPressed.Scale(new CGSize(64.0f, 64.0f));
				uiButtonImages[1] = Resources.mediumButtonPressed.Scale(new CGSize(64.0f, 64.0f)); 
				uiButtonImages[2] = Resources.mediumButtonDisabled.Scale(new CGSize(64.0f, 64.0f));

				// HACK:
				dimensions = new CGSize(uiButtonImages[0].Size.Width, uiButtonImages[0].Size.Height);
				location = new CGPoint(UIScreen.MainScreen.FixedCoordinateSpace.Bounds.GetMidY() - (dimensions.Width / 2f) - Story.OptionOffset,
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

