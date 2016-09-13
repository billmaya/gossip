using System;
using CoreGraphics;
using CoreGraphics;
using Foundation;
using UIKit;

namespace Gossip
{
	[Register("FiveButtonView")]
	public class FiveButtonView : ButtonView
	{
		public FiveButtonView ()
		{
			if (UIDevice.CurrentDevice.UserInterfaceIdiom == UIUserInterfaceIdiom.Pad)
			{
				uiButtonImages[0] = Resources.fiveButtonNotPressed;
				uiButtonImages[1] = Resources.fiveButtonPressed;
				uiButtonImages[2] = Resources.fiveButtonDisabled;

				// HACK: Eventually combine with 28-30 and move to 33-35
				dimensions = new CGSize(uiButtonImages[0].Size.Width, uiButtonImages[0].Size.Height);
				location = new CGPoint (UIScreen.MainScreen.FixedCoordinateSpace.Bounds.GetMidY() - (dimensions.Width / 2f) - Story.OptionOffset, 175f);
			}
			else 
			{
				uiButtonImages[0] = Resources.fiveButtonNotPressed.Scale(new CGSize(64.0f, 64.0f));
				uiButtonImages[1] = Resources.fiveButtonPressed.Scale(new CGSize(64.0f, 64.0f));
				uiButtonImages[2] = Resources.fiveButtonDisabled.Scale(new CGSize(64.0f, 64.0f));

				// HACK:
				dimensions = new CGSize(uiButtonImages[0].Size.Width, uiButtonImages[0].Size.Height);
				location = new CGPoint (UIScreen.MainScreen.FixedCoordinateSpace.Bounds.GetMidY() - (dimensions.Width / 2f) - Story.OptionOffset, 
					UIScreen.MainScreen.FixedCoordinateSpace.Bounds.Width / 5.5f);
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
				if (this.pressed) uiButtonImages[1].Draw(new CGPoint(0f, 0f));
				else if (this.disabled) uiButtonImages[2].Draw(new CGPoint(0f, 0f));
				else uiButtonImages[0].Draw (new CGPoint(0f, 0f));
			}
		}

		public override void TouchesEnded (NSSet touches, UIEvent evt)
		{
			base.TouchesEnded (touches, evt);

			if (this.disabled) return;

			if (this.Pressed == false) 
			{
				Story.Characters = 5;

				((OptionsView)this.Superview).fourButton.pressed = false;
				this.pressed = true;
				((OptionsView)this.Superview).sixButton.pressed = false;

				((OptionsView)this.Superview).fourButton.SetNeedsDisplay();
				this.SetNeedsDisplay();
				((OptionsView)this.Superview).sixButton.SetNeedsDisplay();
			}
		}
	}
}

