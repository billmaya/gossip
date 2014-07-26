using System;
using System.Drawing;
using MonoTouch.CoreGraphics;
using MonoTouch.Foundation;
using MonoTouch.UIKit;

namespace Gossip
{
	[Register("TextView")]
	public class TextView : UIView 
	{
		protected SizeF dimensions;
		protected PointF location;

		protected string text;
		protected float fontSize;

		protected float translationY;

		public TextView ()
		{
		}

		internal virtual void SetText(string message)
		{
			text = message;
		}

		protected void ModifyFrame()
		{
			RectangleF frame = this.Frame;
			
			frame.Width = dimensions.Width;
			frame.Height = dimensions.Height;
			frame.X = location.X;
			frame.Y = location.Y;
			
			this.Frame = frame;
		}
	}
}

