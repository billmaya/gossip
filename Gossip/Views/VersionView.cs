using System;
using CoreGraphics;
using CoreGraphics;
using Foundation;
using UIKit;

namespace Gossip
{
	[Register("VersionView")]
	public class VersionView : TextView
	{
		public VersionView()
		{
			if (UIDevice.CurrentDevice.UserInterfaceIdiom == UIUserInterfaceIdiom.Pad)
			{
				location = new CGPoint(UIScreen.MainScreen.FixedCoordinateSpace.Bounds.Height - 80f /*70f*/, 10f /*2f*/);
				dimensions = new CGSize(70f /*60f*/, 30f);
				translationY = 20f;

				fontSize = 24f;
			}
			else
			{
				location = new CGPoint(UIScreen.MainScreen.FixedCoordinateSpace.Bounds.Height - 40f, 2f);
				dimensions = new CGSize(30f, 13f);
				translationY = 12f;

				fontSize = 12f;
			}

			ModifyFrame();
		}

		public override void Draw (CGRect rect)
		{
			base.Draw (rect);

			using (CGContext gctx = UIGraphics.GetCurrentContext())
			{
				gctx.SetFillColor(UIColor.Black.CGColor);
				gctx.FillRect(new CGRect(0, 0, this.Frame.Width, this.Frame.Height));

				gctx.SetFillColor(UIColor.White.CGColor);
				gctx.SelectFont("Arial", fontSize, CGTextEncoding.MacRoman);
				gctx.SetTextDrawingMode(CGTextDrawingMode.Fill);

				gctx.TranslateCTM(0, translationY);
				gctx.ScaleCTM(1, -1);

				string version = "v" + Story.Version;

				gctx.ShowTextAtPoint(0f, 0f, version);
			}
		}
	}
}

