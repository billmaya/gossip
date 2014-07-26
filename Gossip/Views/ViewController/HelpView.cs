using System;
using System.Drawing;
using MonoTouch.CoreGraphics;
using MonoTouch.Foundation;
using MonoTouch.UIKit;

namespace Gossip
{
	[Register("HelpView")]
	public class HelpView : UIView
	{
		private UIImage helpImage;
		private bool ipad;
		private float scaleBy;

		internal int index;

		internal LeftArrowHelpView leftArrowHelpView = new LeftArrowHelpView();
		internal RightArrowHelpView rightArrowHelpView = new RightArrowHelpView();
		internal HelpViewController hvc;

		public HelpView(IntPtr p) : base(p)
		{
			if (UIDevice.CurrentDevice.UserInterfaceIdiom == UIUserInterfaceIdiom.Pad)
			{
				ipad = true;
			}
			else
			{
				ipad = false;
				scaleBy = 0.85f;
			}
		}

		public override void Draw(RectangleF rect)
		{
			base.Draw(rect);

			using (CGContext gctx = UIGraphics.GetCurrentContext ()) {

				gctx.SetFillColor(UIColor.Black.CGColor);
				gctx.FillRect(new RectangleF(0, 0, UIScreen.MainScreen.Bounds.Height, UIScreen.MainScreen.Bounds.Width));
			

				switch (index) 
				{
				case 0:
					if (ipad) helpImage = Resources.rulesGame;
					else helpImage = Resources.rulesGame.Scale(new SizeF(UIScreen.MainScreen.Bounds.Height * scaleBy, UIScreen.MainScreen.Bounds.Width * scaleBy));
					break;
				case 1:
					if (ipad) helpImage = Resources.rulesBara;
					else helpImage = Resources.rulesBara.Scale(new SizeF(UIScreen.MainScreen.Bounds.Height * scaleBy, UIScreen.MainScreen.Bounds.Width * scaleBy));
					break;
				case 2:
					if (ipad) helpImage = Resources.rulesOwen;
					else helpImage = Resources.rulesOwen.Scale(new SizeF(UIScreen.MainScreen.Bounds.Height * scaleBy, UIScreen.MainScreen.Bounds.Width * scaleBy));
					break;
				case 3:
					if (ipad) helpImage = Resources.rulesMax;
					else helpImage = Resources.rulesMax.Scale(new SizeF(UIScreen.MainScreen.Bounds.Height * scaleBy, UIScreen.MainScreen.Bounds.Width * scaleBy));
					break;
				case 4:
					if (ipad) helpImage = Resources.rulesElla;
					else helpImage = Resources.rulesElla.Scale(new SizeF(UIScreen.MainScreen.Bounds.Height * scaleBy, UIScreen.MainScreen.Bounds.Width * scaleBy));
					break;
				case 5:
					if (ipad) helpImage = Resources.rulesMort;
					else helpImage = Resources.rulesMort.Scale(new SizeF(UIScreen.MainScreen.Bounds.Height * scaleBy, UIScreen.MainScreen.Bounds.Width * scaleBy));
					break;
				case 6:
					if (ipad) helpImage = Resources.rulesZoe;
					else helpImage = Resources.rulesZoe.Scale(new SizeF(UIScreen.MainScreen.Bounds.Height * scaleBy, UIScreen.MainScreen.Bounds.Width * scaleBy));
					break;
				}

				helpImage.Draw(new PointF((UIScreen.MainScreen.Bounds.Height - helpImage.Size.Width) / 2f, 0f));

				this.AddSubview(leftArrowHelpView);
				leftArrowHelpView.SetNeedsDisplay();

				if (index == Story.Characters) {
//					rightArrowHelpView.RemoveFromSuperview();
				} else {
					this.AddSubview(rightArrowHelpView);
					rightArrowHelpView.SetNeedsDisplay();
				}
			}
		}
	}
}

