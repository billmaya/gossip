using System;
using System.Drawing;
using MonoTouch.CoreGraphics;
using MonoTouch.Foundation;
using MonoTouch.UIKit;

namespace Gossip
{
	[Register("CharacterView")]
	public class CharacterView : UIView
	{
		protected int characterId;
		protected UIImage[] uiCharacterImages = new UIImage[Story.AffinityLevels + 1];
		protected UIImage uiQuotationMarks;
		protected UIImage uiEmptyQuotationMarks;

		protected SizeF dimensions;
		protected PointF location;

		internal bool halo;
		internal UIColor haloColor;
		internal bool fillHalo;

		internal bool quoted;
		private PointF quotePosition;

		public int Affinity { get; set; }

		public CharacterView ()
		{
			if (UIDevice.CurrentDevice.UserInterfaceIdiom == UIUserInterfaceIdiom.Pad) 
			{
				uiQuotationMarks = Resources.quotationMarks.Scale(new SizeF(136.5f, 37.5f));
				quotePosition = new PointF(-5f, 0f);
			}
			else
			{
				uiQuotationMarks = Resources.quotationMarks.Scale(new SizeF(68.25f, 16.75f));
				quotePosition = new PointF(-2f, 0f);
			}
		}

		public override void Draw(RectangleF rect)
		{
			base.Draw (rect);

			using (CGContext gctx = UIGraphics.GetCurrentContext())
			{
								gctx.SetFillColor(UIColor.Black.CGColor);
				gctx.FillRect(new RectangleF(0, 0, this.Frame.Width, this.Frame.Height));

				if (!halo && !quoted)
				{
					uiCharacterImages[Affinity].Draw(new PointF(0.0f, 0.0f));
				}
				else if (halo && !quoted)
				{
					DrawHalo(haloColor, fillHalo);
					uiCharacterImages[Affinity].Draw(new PointF(0.0f, 0.0f));
				}
				else if (halo && quoted)
				{
					DrawHalo(haloColor, fillHalo);
					uiCharacterImages[Affinity].Draw(new PointF(0.0f, 0.0f));
					DrawQuotes();
				}

			}
		}

		internal void SetHalo(bool visible, UIColor color, bool filled)
		{
			halo = visible;
			haloColor = color;
			fillHalo = filled;
		}

		internal void DrawHalo(UIColor color, bool filled)
		{
			using (CGContext gctx = UIGraphics.GetCurrentContext())
			{
				gctx.SetLineWidth(2.0f);
				gctx.SetStrokeColor(color.CGColor);
				gctx.SetFillColor(color.CGColor);
				gctx.AddEllipseInRect(new RectangleF(new PointF(0f, 0f), dimensions));
				gctx.ClosePath();

				if (filled) gctx.DrawPath(CGPathDrawingMode.FillStroke); 
				else gctx.DrawPath(CGPathDrawingMode.Stroke);
			}
		}

		private void EraseHalo()
		{
			using (CGContext gctx = UIGraphics.GetCurrentContext())
			{
				gctx.SetLineWidth(2.0f);
				gctx.SetStrokeColor(UIColor.Black.CGColor);
				gctx.SetFillColor(UIColor.Black.CGColor);
				gctx.AddEllipseInRect(new RectangleF(new PointF(0f, 0f), dimensions));
				gctx.ClosePath();

				gctx.DrawPath(CGPathDrawingMode.FillStroke); 
			}
		}

		internal void DrawQuotes()
		{
			using (CGContext gctx = UIGraphics.GetCurrentContext()) 
			{
				uiQuotationMarks.Draw(new RectangleF(quotePosition, new SizeF(uiQuotationMarks.Size.Width, uiQuotationMarks.Size.Height)));
			}
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

		public override void TouchesBegan (NSSet touches, UIEvent evt)
		{
			base.TouchesBegan (touches, evt);

			UITouch touch = touches.AnyObject as UITouch;
			if (touch != null) 
			{
				PointF pt = touch.LocationInView(this);
				Console.WriteLine(pt.ToString());

				Story.Selected = characterId;
			}
		}
	}
}

