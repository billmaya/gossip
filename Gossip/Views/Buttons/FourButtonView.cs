using System;
using CoreGraphics;
using Foundation;
using UIKit;

namespace Gossip
{
	[Register("FourButtonView")]
	public class FourButtonView : ButtonView
	{
		public FourButtonView ()
		{
			if (UIDevice.CurrentDevice.UserInterfaceIdiom == UIUserInterfaceIdiom.Pad)
			{
				uiButtonImages[0] = Resources.fourButtonNotPressed;
				uiButtonImages[1] = Resources.fourButtonPressed;

				// HACK: Eventually combine with 28-30 and move to 33-35
				dimensions = new CGSize(uiButtonImages[0].Size.Width, uiButtonImages[0].Size.Height);
				location = new CGPoint((UIScreen.MainScreen.FixedCoordinateSpace.Bounds.Height / 4f) - (dimensions.Width / 2f) - Story.OptionOffset, 175f);
			}
			else 
			{
				uiButtonImages[0] = Resources.fourButtonNotPressed.Scale(new CGSize(64.0f, 64.0f));
				uiButtonImages[1] = Resources.fourButtonPressed.Scale(new CGSize(64.0f, 64.0f)); 

				// HACK:
				dimensions = new CGSize(uiButtonImages[0].Size.Width, uiButtonImages[0].Size.Height);
				location = new CGPoint((UIScreen.MainScreen.FixedCoordinateSpace.Bounds.Height / 4f) - (dimensions.Width / 2f) - Story.OptionOffset, 
					UIScreen.MainScreen.FixedCoordinateSpace.Bounds.Width / 5.5f);
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

			if (this.Pressed == false) 
			{
				Story.Characters = 4;

				this.pressed = true;
				((OptionsView)this.Superview).fiveButton.pressed = false;
				((OptionsView)this.Superview).sixButton.pressed = false;

				this.SetNeedsDisplay();
				((OptionsView)this.Superview).fiveButton.SetNeedsDisplay();
				((OptionsView)this.Superview).sixButton.SetNeedsDisplay();
			}
		}
	}
}

