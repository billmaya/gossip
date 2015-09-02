using System;
using System.Drawing;
using MonoTouch.CoreGraphics;
using MonoTouch.Foundation;
using MonoTouch.UIKit;

namespace Gossip
{
	[Register("VersionView")]
	public class VersionView : TextView
	{
		public VersionView()
		{
			if (UIDevice.CurrentDevice.UserInterfaceIdiom == UIUserInterfaceIdiom.Pad)
			{
				location = new PointF(UIScreen.MainScreen.FixedCoordinateSpace.Bounds.Height - 80f /*70f*/, 2f);
				dimensions = new SizeF(70f /*60f*/, 30f);
				translationY = 20f;

				fontSize = 24f;
			}
			else
			{
				location = new PointF(UIScreen.MainScreen.FixedCoordinateSpace.Bounds.Height - 40f, 2f);
				dimensions = new SizeF(30f, 13f);
				translationY = 12f;

				fontSize = 12f;
			}

			ModifyFrame();
		}

		public override void Draw (RectangleF rect)
		{
			base.Draw (rect);

			using (CGContext gctx = UIGraphics.GetCurrentContext())
			{
				gctx.SetFillColor(UIColor.Black.CGColor);
				gctx.FillRect(new RectangleF(0, 0, this.Frame.Width, this.Frame.Height));

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

