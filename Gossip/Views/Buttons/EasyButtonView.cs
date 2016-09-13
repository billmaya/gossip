using System;
using CoreGraphics;
using CoreGraphics;
using Foundation;
using UIKit;

namespace Gossip
{
	[Register("EasyButtonView")]
	public class EasyButtonView : ButtonView
	{
		public EasyButtonView ()
		{
			if (UIDevice.CurrentDevice.UserInterfaceIdiom == UIUserInterfaceIdiom.Pad)
			{
				uiButtonImages[0] = Resources.easyButtonNotPressed;
				uiButtonImages[1] = Resources.easyButtonPressed;

				// HACK:
				dimensions = new CGSize(uiButtonImages[0].Size.Width, uiButtonImages[0].Size.Height);
				location = new CGPoint((UIScreen.MainScreen.FixedCoordinateSpace.Bounds.Height / 4f) - (dimensions.Width / 2f) - Story.OptionOffset, 
					UIScreen.MainScreen.FixedCoordinateSpace.Bounds.Width - (dimensions.Height + 80f));
			}
			else 
			{
				uiButtonImages[0] = Resources.easyButtonNotPressed.Scale(new CGSize(64.0f, 64.0f));
				uiButtonImages[1] = Resources.easyButtonPressed.Scale(new CGSize(64.0f, 64.0f));

				// HACK:
				dimensions = new CGSize(uiButtonImages[0].Size.Width, uiButtonImages[0].Size.Height);
				location = new CGPoint((UIScreen.MainScreen.FixedCoordinateSpace.Bounds.Height / 4f) - (dimensions.Width / 2f) - Story.OptionOffset, 
					UIScreen.MainScreen.FixedCoordinateSpace.Bounds.Width - (dimensions.Height + 20f));
			}

			ModifyFrame();
		}

		public override void Draw (CGRect rect)
		{
			base.Draw (rect);

			using (gctx = UIGraphics.GetCurrentContext ()) 
			{
				if (this.pressed) uiButtonImages[1].Draw(new CGPoint(0f, 0f));
				else uiButtonImages[0].Draw (new CGPoint(0f, 0f));
			}
		}

		public override void TouchesEnded (NSSet touches, UIEvent evt)
		{
			base.TouchesEnded (touches, evt);

			if (this.pressed == false) 
			{
				Story.DifficultyLevel = 0;

				this.pressed = true;
				((OptionsView)this.Superview).mediumButton.Pressed = false;
				((OptionsView)this.Superview).hardButton.Pressed = false;

				this.SetNeedsDisplay();
				((OptionsView)this.Superview).mediumButton.SetNeedsDisplay();
				((OptionsView)this.Superview).hardButton.SetNeedsDisplay();
			}
		}
	}
}

