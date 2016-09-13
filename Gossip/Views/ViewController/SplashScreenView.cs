using System;
using CoreGraphics;
using CoreGraphics;
using Foundation;
using UIKit;

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

		public override void Draw(CGRect rect)
		{
			base.Draw(rect);

			using (CGContext gctx = UIGraphics.GetCurrentContext ()) {

				gctx.SetFillColor(UIColor.Black.CGColor);
				gctx.FillRect(new CGRect(0, 0, 
					UIScreen.MainScreen.FixedCoordinateSpace.Bounds.Height, UIScreen.MainScreen.FixedCoordinateSpace.Bounds.Width));
			}

			splashScreenImage.Draw(new CGRect(new CGPoint(0f, 0f), 
				new CGSize(UIScreen.MainScreen.FixedCoordinateSpace.Bounds.Height, UIScreen.MainScreen.FixedCoordinateSpace.Bounds.Width)));

			this.AddSubview(version);
			version.SetNeedsDisplay();
		}
	}
}

