using System;
using CoreGraphics;
using CoreGraphics;
using Foundation;
using UIKit;

namespace Gossip
{
	[Register("RulesButtonView")]
	public class RulesButtonView : ButtonView
	{
		public MainViewController mvc { get; set; }

		public RulesButtonView ()
		{
			if (UIDevice.CurrentDevice.UserInterfaceIdiom == UIUserInterfaceIdiom.Pad)
			{
				uiButtonImages[0] = Resources.rulesEnabled;
				uiButtonImages[1] = Resources.rulesPressed;
				uiButtonImages[2] = Resources.rulesDisabled;
			}
			else 
			{
				uiButtonImages[0] = Resources.rulesEnabled.Scale(new CGSize(64.0f, 64.0f));
				uiButtonImages[1] = Resources.rulesPressed.Scale(new CGSize(64.0f, 64.0f));
				uiButtonImages[2] = Resources.rulesDisabled.Scale(new CGSize(64.0f, 64.0f)); 
			}

			dimensions = new CGSize(uiButtonImages[0].Size.Width, uiButtonImages[0].Size.Height);
			location = new CGPoint(5f, 5f);
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

		public override void TouchesEnded(NSSet touches, UIEvent evt)
		{
			base.TouchesEnded(touches, evt);

			this.pressed = false;
			this.SetNeedsDisplay();

			((MainView)this.Superview).mvc.ShowHelpScreen();
		}
	}
}

