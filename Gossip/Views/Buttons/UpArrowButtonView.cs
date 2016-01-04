using System;
using System.Drawing;
using MonoTouch.CoreGraphics;
using MonoTouch.Foundation;
using MonoTouch.UIKit;

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
				uiButtonImages[0] = Resources.upArrowEnabled.Scale(new SizeF(64.0f, 64.0f));
				uiButtonImages[1] = Resources.upArrowPressed.Scale(new SizeF(64.0f, 64.0f));
				uiButtonImages[2] = Resources.upArrowDisabled.Scale(new SizeF(64.0f, 64.0f)); 
			}

			dimensions = new SizeF(uiButtonImages[0].Size.Width, uiButtonImages[0].Size.Height);
			location = new PointF(UIScreen.MainScreen.Bounds.Width - (dimensions.Width + 5), 5);
			ModifyFrame();
		}

		public override void Draw (RectangleF rect)
		{
			base.Draw (rect);

			using (gctx = UIGraphics.GetCurrentContext ()) 
			{
				if (this.enabled) {
					if (this.pressed)
						uiButtonImages[1].Draw(new PointF(0f, 0f));
					else
						uiButtonImages[0].Draw(new PointF(0f, 0f));
				}
				else uiButtonImages[2].Draw (new PointF(0f, 0f));
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

