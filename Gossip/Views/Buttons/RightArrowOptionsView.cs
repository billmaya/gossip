using System;
using CoreGraphics;
using Foundation;
using UIKit;

namespace Gossip
{
	[Register("RightArrowOptionsView")]
	public class RightArrowOptionsView : ButtonView
	{
		public RightArrowOptionsView ()
		{
			if (UIDevice.CurrentDevice.UserInterfaceIdiom == UIUserInterfaceIdiom.Pad)
			{
				uiButtonImages[0] = Resources.rightArrowEnabled;
				uiButtonImages[1] = Resources.rightArrowPressed;
				uiButtonImages[2] = Resources.rightArrowDisabled;
			}
			else 
			{
				uiButtonImages[0] = Resources.rightArrowEnabled.Scale(new CGSize(64.0f, 64.0f));
				uiButtonImages[1] = Resources.rightArrowPressed.Scale(new CGSize(64.0f, 64.0f)); 
				uiButtonImages[2] = Resources.rightArrowDisabled.Scale(new CGSize(64.0f, 64.0f)); 
			} 

			dimensions = new CGSize(uiButtonImages[0].Size.Width, uiButtonImages[0].Size.Height);
			location = new CGPoint(UIScreen.MainScreen.FixedCoordinateSpace.Bounds.Height - (dimensions.Width + 20f), 
				UIScreen.MainScreen.FixedCoordinateSpace.Bounds.GetMidX() - (dimensions.Width / 2f));
			ModifyFrame();
		}

		public override void Draw (CGRect rect)
		{
			base.Draw (rect);

			using (gctx = UIGraphics.GetCurrentContext()) 
			{
				if (pressed) uiButtonImages[1].Draw(new CGPoint(0f, 0f));
				else uiButtonImages[0].Draw (new CGPoint(0f, 0f));
			}
		}

		public override void TouchesBegan (NSSet touches, UIEvent evt)
		{
			base.TouchesBegan (touches, evt);

			this.pressed = true;
			this.SetNeedsDisplay();
		}

		public override void TouchesEnded (NSSet touches, UIEvent evt)
		{
			base.TouchesEnded (touches, evt);

			this.pressed = false;
			this.SetNeedsDisplay();

			if (((OptionsView)this.Superview).fourButton.Pressed) Story.Characters = 4;
			if (((OptionsView)this.Superview).fiveButton.Pressed) Story.Characters = 5;
			if (((OptionsView)this.Superview).sixButton.Pressed) Story.Characters = 6;

			if (((OptionsView)this.Superview).easyButton.Pressed) Story.DifficultyLevel = 0;
			if (((OptionsView)this.Superview).mediumButton.Pressed) Story.DifficultyLevel = 1;
			if (((OptionsView)this.Superview).hardButton.Pressed) Story.DifficultyLevel = 2;

			((OptionsView)this.Superview).ovc.ShowMainScreen();
		}
	}
}

