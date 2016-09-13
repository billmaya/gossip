using System;
using CoreGraphics;
using Foundation;
using UIKit;

namespace Gossip
{
	[Register("ButtonView")]
	public class ButtonView : UIView
	{
		internal bool enabled;
		internal bool pressed;
		internal bool disabled;

		protected CGContext gctx;
		protected UIImage[] uiButtonImages = new UIImage[3];

		internal CGSize dimensions;
		internal CGPoint location;

//		public MainViewController mvc { get; set; }

		public bool Enabled
		{ 
			get { return enabled; } 
			set { enabled = value; this.SetNeedsDisplay(); }
		}

		public bool Pressed
		{
			get { return pressed; }
			set { 
				pressed = value; 
//				this.SetNeedsDisplay();
			}
		}

		public bool Disabled
		{
			get { return disabled; }
			set { disabled = value; }
		}

		public ButtonView ()
		{
		}

		protected void ModifyFrame()
		{
			CGRect frame = this.Frame;
			
			frame.Width = dimensions.Width;
			frame.Height = dimensions.Height;
			frame.X = location.X;
			frame.Y = location.Y;
			
			this.Frame = frame;
		}

		public override void TouchesEnded (NSSet touches, UIEvent evt)
		{
			base.TouchesEnded (touches, evt);

//			if (mvc == null) mvc = ((MainView)this.Superview).mvc;
			
//			UITouch touch = touches.AnyObject as UITouch;
//			if (touch != null) 
//			{
//				PointF pt = touch.LocationInView(this);
//				Console.WriteLine(pt.ToString());
//			}
		}
	}
}

