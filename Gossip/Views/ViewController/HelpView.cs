using System;
using CoreGraphics;
using CoreGraphics;
using Foundation;
using UIKit;

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

		public override void Draw(CGRect rect)
		{
			base.Draw(rect);

			using (CGContext gctx = UIGraphics.GetCurrentContext ()) {

				gctx.SetFillColor(UIColor.Black.CGColor);
				gctx.FillRect(new CGRect(0, 0, UIScreen.MainScreen.Bounds.Width, UIScreen.MainScreen.Bounds.Height));
			

				switch (index) 
				{
				case 0:
					if (ipad) helpImage = Resources.rulesGame;
					else helpImage = Resources.rulesGame.Scale(new CGSize(UIScreen.MainScreen.Bounds.Width * scaleBy, UIScreen.MainScreen.Bounds.Height * scaleBy));
					break;
				case 1:
					if (ipad) helpImage = Resources.rulesBara;
					else helpImage = Resources.rulesBara.Scale(new CGSize(UIScreen.MainScreen.Bounds.Width * scaleBy, UIScreen.MainScreen.Bounds.Height * scaleBy));
					break;
				case 2:
					if (ipad) helpImage = Resources.rulesOwen;
					else helpImage = Resources.rulesOwen.Scale(new CGSize(UIScreen.MainScreen.Bounds.Width * scaleBy, UIScreen.MainScreen.Bounds.Height * scaleBy));
					break;
				case 3:
					if (ipad) helpImage = Resources.rulesMax;
					else helpImage = Resources.rulesMax.Scale(new CGSize(UIScreen.MainScreen.Bounds.Width * scaleBy, UIScreen.MainScreen.Bounds.Height * scaleBy));
					break;
				case 4:
					if (ipad) helpImage = Resources.rulesElla;
					else helpImage = Resources.rulesElla.Scale(new CGSize(UIScreen.MainScreen.Bounds.Width * scaleBy, UIScreen.MainScreen.Bounds.Height * scaleBy));
					break;
				case 5:
					if (ipad) helpImage = Resources.rulesMort;
					else helpImage = Resources.rulesMort.Scale(new CGSize(UIScreen.MainScreen.Bounds.Width * scaleBy, UIScreen.MainScreen.Bounds.Height * scaleBy));
					break;
				case 6:
					if (ipad) helpImage = Resources.rulesZoe;
					else helpImage = Resources.rulesZoe.Scale(new CGSize(UIScreen.MainScreen.Bounds.Width * scaleBy, UIScreen.MainScreen.Bounds.Height * scaleBy));
					break;
				}

				helpImage.Draw(new CGPoint((UIScreen.MainScreen.Bounds.Width - helpImage.Size.Width) / 2f, 0f));

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

