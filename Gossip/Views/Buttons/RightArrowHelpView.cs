using System;
using CoreGraphics;
using CoreGraphics;
using Foundation;
using UIKit;

namespace Gossip
{
	[Register("RightArrowHelpView")]
	public class RightArrowHelpView : ButtonView
	{
		public RightArrowHelpView()
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
			location = new CGPoint(UIScreen.MainScreen.Bounds.Width - (dimensions.Width + 5), UIScreen.MainScreen.Bounds.Height - (dimensions.Width + 20));
			ModifyFrame();
		}

		public override void Draw(CGRect rect)
		{
			base.Draw(rect);

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

			int currentIndex = ((HelpView)this.Superview).index;

			if (currentIndex == Story.Characters) //6) 
			{
				currentIndex = 0; 
				((HelpView)this.Superview).index = currentIndex;
			} else 
			{
				((HelpView)this.Superview).index = ++currentIndex;
			}

			((HelpView)this.Superview).SetNeedsDisplay();
		}
	}
}

