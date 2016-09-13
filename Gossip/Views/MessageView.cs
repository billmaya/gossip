using System;
using CoreGraphics;
using Foundation;
using UIKit;

namespace Gossip
{
	[Register("MessageView")]
	public class MessageView : TextView
	{
		private int maxCharsPerLine;
		private float currentY;
		private float incrementY;
		private string line;

		public MessageView ()
		{
			if (UIDevice.CurrentDevice.UserInterfaceIdiom == UIUserInterfaceIdiom.Pad)
			{
				location = new CGPoint(Story.CharacterLocations[0, 0], Story.CharacterLocations[0, 1]  + 128 + 10);
				dimensions = new CGSize(295f, 90f);
				translationY = 20f;

				fontSize = 24f;
				maxCharsPerLine = 25;
				incrementY = 30;
			}
			else
			{
				location = new CGPoint(Story.CharacterLocations[0, 0] - 10, Story.CharacterLocations[0, 1]  + 64 + 3);
				dimensions = new CGSize(165f, 39f);
				translationY = 12f;

				fontSize = 12f;
				maxCharsPerLine = 28;
				incrementY = 13;
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

				line = text;
				currentY = 0f;
				while (line.Length > maxCharsPerLine)
				{
					string shortLine = line.Substring(0, maxCharsPerLine);
					int chars = shortLine.Length - 1;
					while (!shortLine.EndsWith(" "))
					{
						shortLine = shortLine.Substring(0, --chars);
					}
					gctx.ShowTextAtPoint (0f, currentY, shortLine);
					currentY -= incrementY;
					line = line.Substring(chars);
				}
				gctx.ShowTextAtPoint(0f, currentY, line);
			}
		}
	}
}

