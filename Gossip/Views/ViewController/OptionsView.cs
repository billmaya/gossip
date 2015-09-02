using System;
using System.Drawing;
using MonoTouch.CoreGraphics;
using MonoTouch.Foundation;
using MonoTouch.UIKit;

namespace Gossip
{
	[Register("OptionsView")]
	public class OptionsView : UIView
	{
		internal FourButtonView fourButton = new FourButtonView();
		internal FiveButtonView fiveButton = new FiveButtonView();
		internal SixButtonView sixButton = new SixButtonView();

		internal EasyButtonView easyButton = new EasyButtonView();
		internal MediumButtonView mediumButton = new MediumButtonView();
		internal HardButtonView hardButton = new HardButtonView();

		internal RightArrowOptionsView rightArrow = new RightArrowOptionsView();

		internal StoreButtonView storeButton = new StoreButtonView();

		public OptionsViewController ovc { get; set; }

		public OptionsView (IntPtr p) : base(p)
		{
		}

		public override void Draw (RectangleF rect)
		{
			base.Draw (rect);

			using (CGContext gctx = UIGraphics.GetCurrentContext ()) {

				gctx.SetFillColor(UIColor.Black.CGColor);
				gctx.FillRect(new RectangleF(0, 0, 
					UIScreen.MainScreen.FixedCoordinateSpace.Bounds.Height, UIScreen.MainScreen.FixedCoordinateSpace.Bounds.Width));
			}

			this.AddSubview(fourButton);
			fourButton.Pressed = true;
			fourButton.SetNeedsDisplay();

			this.AddSubview(fiveButton);
			fiveButton.SetNeedsDisplay();

			this.AddSubview(sixButton);
			sixButton.SetNeedsDisplay();

			this.AddSubview(easyButton);
			easyButton.Pressed = true;
			easyButton.SetNeedsDisplay();

			this.AddSubview(mediumButton);
			mediumButton.SetNeedsDisplay();

			this.AddSubview(hardButton);
			hardButton.SetNeedsDisplay();

			this.AddSubview(rightArrow);
			rightArrow.SetNeedsDisplay();

			if (Story.Free) {
				this.AddSubview(storeButton);
				storeButton.SetNeedsDisplay();
			}

			// HACK: 62-64
			float yOffset = 0f;
			if (UIDevice.CurrentDevice.UserInterfaceIdiom == UIUserInterfaceIdiom.Pad) yOffset = 160f;
			else yOffset = 65f;

			DrawText("How Many Players?",
				(UIScreen.MainScreen.FixedCoordinateSpace.Bounds.Height / 4f) - (fourButton.dimensions.Width / 2f) - Story.OptionOffset, 
				UIScreen.MainScreen.FixedCoordinateSpace.Bounds.Width - yOffset);

			// HACK: 71-73
			yOffset = 0f;
			if (UIDevice.CurrentDevice.UserInterfaceIdiom == UIUserInterfaceIdiom.Pad) yOffset = 50f;
			else yOffset = 15f;

			DrawText("Easy", fourButton.location.X - 10f, fourButton.location.Y + yOffset);
			DrawText("Medium", fiveButton.location.X - 60f, fiveButton.location.Y + yOffset);
			DrawText("Hard", sixButton.location.X - 10f, sixButton.location.Y + yOffset); 
		}

		internal void DrawText(string text, float x, float y)
		{
			using (CGContext gctx = UIGraphics.GetCurrentContext())
			{
				gctx.SetFillColor(UIColor.White.CGColor);
				gctx.SetTextDrawingMode(CGTextDrawingMode.Fill);

				if (UIDevice.CurrentDevice.UserInterfaceIdiom == UIUserInterfaceIdiom.Pad)
				{
					gctx.SelectFont("Arial", 72f, CGTextEncoding.MacRoman);
				}
				else
				{
					gctx.SelectFont("Arial", 36f, CGTextEncoding.MacRoman);
					// HACK:
					if (text.Contains("Medium")) x = x + 25;
				}

				gctx.SaveState();

				gctx.TranslateCTM(0, this.Frame.Width);
				gctx.ScaleCTM(1, -1);

				gctx.ShowTextAtPoint (x, y, text);

				gctx.RestoreState();
			}
		}
	}
}

