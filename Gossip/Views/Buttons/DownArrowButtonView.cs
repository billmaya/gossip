using System;
using CoreGraphics;
using CoreGraphics;
using Foundation;
using UIKit;

namespace Gossip
{
	[Register("DownArrowButtonView")]
	public class DownArrowButtonView : ButtonView
	{
		public MainViewController mvc { get; set; }

		public DownArrowButtonView ()
		{
			if (UIDevice.CurrentDevice.UserInterfaceIdiom == UIUserInterfaceIdiom.Pad) 
			{ 
				uiButtonImages[0] = Resources.downArrowEnabled;
				uiButtonImages[1] = Resources.downArrowPressed;
				uiButtonImages[2] = Resources.downArrowDisabled;
			}
			else 
			{
				uiButtonImages[0] = Resources.downArrowEnabled.Scale(new CGSize(64.0f, 64.0f));
				uiButtonImages[1] = Resources.downArrowPressed.Scale(new CGSize(64.0f, 64.0f));
				uiButtonImages[2] = Resources.downArrowDisabled.Scale(new CGSize(64.0f, 64.0f)); 
			}

			dimensions = new CGSize(uiButtonImages[0].Size.Width, uiButtonImages[0].Size.Height);
			location = new CGPoint(UIScreen.MainScreen.Bounds.Width - (dimensions.Width + 5f), dimensions.Width + 10f);
			ModifyFrame();
		}

		public override void Draw (CGRect rect)
		{
			base.Draw (rect);

			using (gctx = UIGraphics.GetCurrentContext ()) 
			{
				if (this.enabled) {
					if (this.pressed)
						uiButtonImages[1].Draw(new CGPoint(0f, 0f));
					else
						uiButtonImages[0].Draw(new CGPoint(0f, 0f));
				}
				else uiButtonImages[2].Draw (new CGPoint(0f, 0f));
			}
		}

		public override void TouchesBegan(NSSet touches, UIEvent evt)
		{
			base.TouchesBegan(touches, evt);

			this.pressed = true;
			this.SetNeedsDisplay();
		}

		public override void TouchesEnded (NSSet touches, UIEvent evt)
		{
			base.TouchesEnded (touches, evt);

			this.pressed = false;
			this.SetNeedsDisplay();

			if (Story.CurrentAffinity > 0) --Story.CurrentAffinity;

			if (mvc == null) mvc = ((MainView)this.Superview).mvc;

			if (Story.CurrentAffinity == 0) mvc.GetButtonView(Story.Button.DownArrow).Enabled = false;
			mvc.GetButtonView(Story.Button.UpArrow).Enabled = true;
		}
	}
}

