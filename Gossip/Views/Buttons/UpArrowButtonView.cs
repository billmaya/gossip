using System;
using CoreGraphics;
using Foundation;
using UIKit;

namespace Gossip
{
	[Register("UpArrowButtonView")]
	public class UpArrowButtonView : ButtonView
	{
		public MainViewController mvc { get; set; }

		public UpArrowButtonView ()
		{
			if (UIDevice.CurrentDevice.UserInterfaceIdiom == UIUserInterfaceIdiom.Pad)
			{
				uiButtonImages[0] = Resources.upArrowEnabled;
				uiButtonImages[1] = Resources.upArrowPressed;
				uiButtonImages[2] = Resources.upArrowDisabled;
			}
			else 
			{
				uiButtonImages[0] = Resources.upArrowEnabled.Scale(new CGSize(64.0f, 64.0f));
				uiButtonImages[1] = Resources.upArrowPressed.Scale(new CGSize(64.0f, 64.0f));
				uiButtonImages[2] = Resources.upArrowDisabled.Scale(new CGSize(64.0f, 64.0f)); 
			}

			dimensions = new CGSize(uiButtonImages[0].Size.Width, uiButtonImages[0].Size.Height);
			location = new CGPoint(UIScreen.MainScreen.Bounds.Width - (dimensions.Width + 5), 5);
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

			if (Story.CurrentAffinity < Story.AffinityLevels - 1) ++Story.CurrentAffinity;

			if (mvc == null) mvc = ((MainView)this.Superview).mvc;

			if (Story.CurrentAffinity == Story.AffinityLevels - 1) mvc.GetButtonView(Story.Button.UpArrow).Enabled = false;
			mvc.GetButtonView(Story.Button.DownArrow).Enabled = true;
		}
	}
}

