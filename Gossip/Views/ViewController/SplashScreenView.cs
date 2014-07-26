using System;
using System.Drawing;
using MonoTouch.CoreGraphics;
using MonoTouch.Foundation;
using MonoTouch.UIKit;

namespace Gossip
{
	[Register("SplashScreenView")]
	public class SplashScreenView : UIView
	{
		private UIImage splashScreenImage;

		internal VersionView version = new VersionView();

		internal SplashScreenViewController ssvc { get; set; }


		public SplashScreenView(IntPtr p) : base(p)
		{
			if (UIDevice.CurrentDevice.UserInterfaceIdiom == UIUserInterfaceIdiom.Pad)
			{
				splashScreenImage = Resources.splashScreen_2048x1496;
			}
			else
			{
				splashScreenImage = Resources.splashScreen_1136x640;
			}
		}

		public override void Draw(RectangleF rect)
		{
			base.Draw(rect);

			using (CGContext gctx = UIGraphics.GetCurrentContext ()) {

				gctx.SetFillColor(UIColor.Black.CGColor);
				gctx.FillRect(new RectangleF(0, 0, UIScreen.MainScreen.Bounds.Height, UIScreen.MainScreen.Bounds.Width));
			}

			splashScreenImage.Draw(new RectangleF(new PointF(0f, 0f), new SizeF(UIScreen.MainScreen.Bounds.Height, UIScreen.MainScreen.Bounds.Width)));

			this.AddSubview(version);
			version.SetNeedsDisplay();
		}
	}
}

