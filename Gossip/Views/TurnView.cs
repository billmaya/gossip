using System;
using CoreGraphics;
using Foundation;
using UIKit;

namespace Gossip
{
	[Register("TurnView")]
	public class TurnView : TextView
	{
		public TurnView ()
		{
			if (UIDevice.CurrentDevice.UserInterfaceIdiom == UIUserInterfaceIdiom.Pad)
			{
				dimensions = new CGSize(40f, 60f);
				location = new CGPoint(Story.CharacterLocations[0, 0] + (64f - (dimensions.Width / 2f)), Story.CharacterLocations[0, 1] - (dimensions.Height + 10f));
				fontSize = 64f;
				translationY = 48f;
			}
			else
			{
				dimensions = new CGSize(20f, 30f);
				location = new CGPoint(Story.CharacterLocations[0, 0] + (32f - (dimensions.Width / 2f)), Story.CharacterLocations[0, 1] - (dimensions.Height + 5f));
				fontSize = 32f;
				translationY = 24f;
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
				
				gctx.ShowTextAtPoint(0f, 0f, text);
			}
		}
	}
}

