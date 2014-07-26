using System;
using System.Drawing;
using MonoTouch.CoreGraphics;
using MonoTouch.Foundation;
using MonoTouch.UIKit;

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

		public override void Draw (RectangleF rect)
		{
			base.Draw (rect);

			using (CGContext gctx = UIGraphics.GetCurrentContext ()) {

				gctx.SetFillColor(UIColor.Black.CGColor);
				gctx.FillRect(new RectangleF(0, 0, UIScreen.MainScreen.Bounds.Height, UIScreen.MainScreen.Bounds.Width));
			}

			switch (Story.DifficultyLevel)
			{
				case 0:
				if (ipad) tipImage = Resources.easyTips;
				else tipImage = Resources.easyTips.Scale(new SizeF(UIScreen.MainScreen.Bounds.Height * scaleBy, UIScreen.MainScreen.Bounds.Width * scaleBy));
				break;
				case 1:
				if (ipad) tipImage = Resources.mediumTips;
				else tipImage = Resources.easyTips.Scale(new SizeF(UIScreen.MainScreen.Bounds.Height * scaleBy, UIScreen.MainScreen.Bounds.Width * scaleBy));
				break;
				case 2:
				if (ipad) tipImage = Resources.hardTips;
				else tipImage = Resources.easyTips.Scale(new SizeF(UIScreen.MainScreen.Bounds.Height * scaleBy, UIScreen.MainScreen.Bounds.Width * scaleBy));
				break;
			}

			tipImage.Draw(new PointF((UIScreen.MainScreen.Bounds.Height - tipImage.Size.Width) / 2f, 0f));

			this.AddSubview(leftArrowButton);
			leftArrowButton.SetNeedsDisplay();
		}

	}
}

