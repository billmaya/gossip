using System;
using System.Drawing;
using MonoTouch.CoreGraphics;
using MonoTouch.Foundation;
using MonoTouch.UIKit;

namespace Gossip
{
	[Register("FourButtonView")]
	public class FourButtonView : ButtonView
	{
		public FourButtonView ()
		{
			if (UIDevice.CurrentDevice.UserInterfaceIdiom == UIUserInterfaceIdiom.Pad)
			{
				uiButtonImages[0] = Resources.fourButtonNotPressed;
				uiButtonImages[1] = Resources.fourButtonPressed;

				// HACK: Eventually combine with 28-30 and move to 33-35
				dimensions = new SizeF(uiButtonImages[0].Size.Width, uiButtonImages[0].Size.Height);
				location = new PointF((UIScreen.MainScreen.FixedCoordinateSpace.Bounds.Height / 4f) - (dimensions.Width / 2f) - Story.OptionOffset, 175f);
			}
			else 
			{
				uiButtonImages[0] = Resources.fourButtonNotPressed.Scale(new SizeF(64.0f, 64.0f));
				uiButtonImages[1] = Resources.fourButtonPressed.Scale(new SizeF(64.0f, 64.0f)); 

				// HACK:
				dimensions = new SizeF(uiButtonImages[0].Size.Width, uiButtonImages[0].Size.Height);
				location = new PointF((UIScreen.MainScreen.FixedCoordinateSpace.Bounds.Height / 4f) - (dimensions.Width / 2f) - Story.OptionOffset, 
					UIScreen.MainScreen.FixedCoordinateSpace.Bounds.Width / 5.5f);
			} 
		
			ModifyFrame();
		}

		public override void Draw (RectangleF rect)
		{
			base.Draw (rect);

			using (gctx = UIGraphics.GetCurrentContext ()) 
			{
				if (this.pressed) uiButtonImages[1].Draw(new PointF(0f, 0f));
				else uiButtonImages[0].Draw (new PointF(0f, 0f));
			}
		}

		public override void TouchesEnded (MonoTouch.Foundation.NSSet touches, MonoTouch.UIKit.UIEvent evt)
		{
			base.TouchesEnded (touches, evt);

			if (this.Pressed == false) 
			{
				Story.Characters = 4;

				this.pressed = true;
				((OptionsView)this.Superview).fiveButton.pressed = false;
				((OptionsView)this.Superview).sixButton.pressed = false;

				this.SetNeedsDisplay();
				((OptionsView)this.Superview).fiveButton.SetNeedsDisplay();
				((OptionsView)this.Superview).sixButton.SetNeedsDisplay();
			}
		}
	}
}

