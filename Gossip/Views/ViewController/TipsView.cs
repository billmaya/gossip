using System;
using CoreGraphics;
using Foundation;
using UIKit;

namespace Gossip
{
	[Register("TipsView")]
	public class TipsView : UIView
	{
		private UIImage tipImage;
		private bool ipad;
		private float scaleBy;

		internal LeftArrowTipsView leftArrowButton = new LeftArrowTipsView();
		internal TipsViewController tvc { get; set; }

		public TipsView (IntPtr p) : base(p)
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

		public override void Draw (CGRect rect)
		{
			base.Draw (rect);

			using (CGContext gctx = UIGraphics.GetCurrentContext ()) {

				gctx.SetFillColor(UIColor.Black.CGColor);
				gctx.FillRect(new CGRect(0, 0, UIScreen.MainScreen.Bounds.Width, UIScreen.MainScreen.Bounds.Height));
			}

			switch (Story.DifficultyLevel)
			{
				case 0:
				if (ipad) tipImage = Resources.easyTips;
				else tipImage = Resources.easyTips.Scale(new CGSize(UIScreen.MainScreen.Bounds.Width * scaleBy, UIScreen.MainScreen.Bounds.Height * scaleBy));
				break;
				case 1:
				if (ipad) tipImage = Resources.mediumTips;
				else tipImage = Resources.mediumTips.Scale(new CGSize(UIScreen.MainScreen.Bounds.Width * scaleBy, UIScreen.MainScreen.Bounds.Height * scaleBy));
				break;
				case 2:
				if (ipad) tipImage = Resources.hardTips;
				else tipImage = Resources.hardTips.Scale(new CGSize(UIScreen.MainScreen.Bounds.Width * scaleBy, UIScreen.MainScreen.Bounds.Height * scaleBy));
				break;
			}

			tipImage.Draw(new CGPoint((UIScreen.MainScreen.Bounds.Width - tipImage.Size.Width) / 2f, 0f));

			this.AddSubview(leftArrowButton);
			leftArrowButton.SetNeedsDisplay();
		}

	}
}

