using System;
using CoreGraphics;
using Foundation;
using UIKit;

namespace Gossip
{
	[Register("HexagonView")]
	public class HexagonView : UIView
	{
		private readonly int ScreenWidth; // Width of window
		private readonly int ScreenHeight; // Height of window 

		private readonly int FaceSize; // Width and height for face image
		private readonly double Radius; // Radius of the circle circumscribing the hexagon

		private CGContext gctx;
		private int arrowHeadSize;

		public MainViewController mvc { get; set; }

		// These properties are used when a spoke is hilighted // TODO: Make internal ?
		public bool Hilight { get; set; }
		public bool Dashed { get; set; }
		public int From { get; set; }
		public int To { get; set; }
		public int Speaker { get; set; }

		public HexagonView ()
		{
			if (UIDevice.CurrentDevice.UserInterfaceIdiom == UIUserInterfaceIdiom.Pad)
			{
				Radius = 250;
				FaceSize = 128;
			}
			else
			{
				Radius = 145;
				FaceSize = 64;
			}
				
			ScreenWidth = (int)UIScreen.MainScreen.Bounds.Width;
			ScreenHeight = (int)UIScreen.MainScreen.Bounds.Height;

			float WidthMod = 2.73066666666667f;
			float HeightMod = 2.32727272727273f;

			CGRect frame = this.Frame;
			frame.Width = ScreenWidth / WidthMod;  //375;
			frame.Height = ScreenHeight / HeightMod;  //330;
			frame.X = ScreenWidth / 2 - frame.Width / 2;
			frame.Y = ScreenHeight / 2 - frame.Height / 2;

			this.Frame = frame;

			int FrameHexCenterX = (int)frame.Width / 2;
			int FrameHexCenterY = (int)frame.Height / 2;

			// We use Story.MaxCharacters below instead of Story.Characters because
			// we need all the characters positions when positioning character names
			for (int i = 0; i < Story.MaxCharacters; ++i) 
			{
				double angle = DegreeToRadian(60 * i + 90); // Convert 60 1/4 steps to radians
				Story.HexagonX[i] = (int)(FrameHexCenterX + (Radius - 70) * Math.Sin(angle));
				Story.HexagonY[i] = (int)(FrameHexCenterY + (Radius - 70) * Math.Cos(angle));
				
				double dx = (ScreenWidth / 2) + Radius * Math.Sin(angle);
				int x = ((int)dx - FaceSize / 2) + GetXOffset(i);
				double dy = (ScreenHeight / 2) + Radius * Math.Cos (angle);
				int y = ((int)dy - FaceSize / 2) + GetYOffset(i);

				Story.CharacterLocations[i, 0] = x;
				Story.CharacterLocations[i, 1] = y;
				
				for (int j = 0; j < Story.AffinityLevels + 1; ++j) 
				{

				}
			}
		}

		public override void Draw (CGRect rect)
		{
			base.Draw (rect);

			using (gctx = UIGraphics.GetCurrentContext ()) {
				
				gctx.SetFillColor(UIColor.Black.CGColor);
				gctx.FillRect(new CGRect(0, 0, this.Frame.Width, this.Frame.Height));

				if (UIDevice.CurrentDevice.UserInterfaceIdiom == UIUserInterfaceIdiom.Pad)
				{
					if (Story.Turn < Story.MaxTurns)
					{
						gctx.SetLineWidth(2);
						arrowHeadSize = 4;
					} 
					else 
					{
						gctx.SetLineWidth(4);//(5);
						arrowHeadSize = 6;//7;
					}
				}
				else 
				{
					if (Story.Turn < Story.MaxTurns) 
					{
						gctx.SetLineWidth(2); // TODO: Is 1 a better value for line width?
						arrowHeadSize = 2;
					} 
					else 
					{
						gctx.SetLineWidth(3);//(5);
						arrowHeadSize = 3;//7;
					}
				}
				
				for (int i = 0; i < Story.Characters; ++i) {
					for (int j = 0; j < Story.Characters; ++j) {
						if (i != j) {
							int iAffinity = Story.AffinityLevels; // TODO: Confirm that this makes the arrow transparent 
							if (Story.Display == Story.EndGameDisplay) // TODO: This should probably be replaced since it's specific to Mac Gossip 
							{
								iAffinity = (int)(Story.AffinityLevels * ((Story.Affinity [i, j] + 1) / 2));
							} else 
							{
								if (Story.DifficultyLevel == 0)
									iAffinity = (int)(Story.AffinityLevels * ((Story.Affinity[i, j] + 1) / 2));
								else
									iAffinity = (int)(Story.AffinityLevels * ((Story.PerceivedAffinity [Story.Player, i, j] + 1) / 2)); 
							}
							
							double deltaX = Story.HexagonX[j] - Story.HexagonX[i];
							double deltaY = Story.HexagonY[j] - Story.HexagonY[i];
							double lengthX = deltaX * 0.48;
							double lengthY = deltaY * 0.48;
							int tipX = Story.HexagonX[i] + (int)lengthX;
							int tipY = Story.HexagonY[i] + (int)lengthY;
							
							gctx.BeginPath();

							gctx.SetStrokeColor(Story.AffinityLevelColor[iAffinity].CGColor);
							CGPoint[] line = new CGPoint[] { new CGPoint(Story.HexagonX[i], Story.HexagonY[i]), new CGPoint(tipX, tipY) };
							
							gctx.MoveTo(line[0].X, line[0].Y);
							gctx.AddLineToPoint(line[1].X, line[1].Y);
							gctx.ClosePath();
							gctx.StrokePath();
							
							// DrawArrowHead // TODO: Create method for to avoid duplicate code in 220-244; 409-435
//							DrawArrowHead(line, arrowHeadSize, iAffinity);
							gctx.SaveState();

							gctx.SetFillColor(Story.AffinityLevelColor[iAffinity].CGColor);
							gctx.SetStrokeColor(Story.AffinityLevelColor[iAffinity].CGColor);
							double angleInRadians = Math.Atan2 (line[0].Y - line[1].Y, line[0].X -line[1].X);
							
							gctx.BeginPath();
							
							gctx.TranslateCTM(line[1].X, line[1].Y);
							gctx.RotateCTM((float)(angleInRadians -  Math.PI / 2));
							
							CGPoint[] arrowhead = new CGPoint[] {
								new CGPoint (0.0f - arrowHeadSize, 0.0f),
								new CGPoint (0.0f, 0.0f - arrowHeadSize),
								new CGPoint (0.0f + arrowHeadSize, 0.0f)
							};
							
							gctx.MoveTo(arrowhead[0].X, arrowhead[0].Y);
							gctx.AddLineToPoint(arrowhead[1].X, arrowhead[1].Y);
							gctx.AddLineToPoint(arrowhead[2].X, arrowhead[2].Y);
							gctx.ClosePath();
							
							gctx.DrawPath(CGPathDrawingMode.FillStroke);
							
							gctx.RestoreState();
						}
					}
				}

				if (Hilight)
				{
					if (Speaker == Story.Nobody) HilightSpoke(From, To, Dashed);
					else HilightSpoke(From, To, Speaker);
				}
			}
		}

//		internal void DrawArrowHead(PointF[] line, int size, int affinity)
//		{
//			using (gctx = UIGraphics.GetCurrentContext())
//			{
//				gctx.SaveState();
//
//				gctx.SetFillColor(Story.AffinityLevelColor[affinity].CGColor);
//				gctx.SetStrokeColor(Story.AffinityLevelColor[affinity].CGColor);
//				double angleInRadians = Math.Atan2 (line[0].Y - line[1].Y, line[0].X -line[1].X);
//				
//				gctx.BeginPath();
//				
//				gctx.TranslateCTM(line[1].X, line[1].Y);
//				gctx.RotateCTM((float)(angleInRadians -  Math.PI / 2));
//				
//				PointF[] arrowhead = new PointF[] {
//					new PointF (0.0f - size, 0.0f),
//					new PointF (0.0f, 0.0f - size),
//					new PointF (0.0f + size, 0.0f)
//				};
//				
//				gctx.MoveTo(arrowhead[0].X, arrowhead[0].Y);
//				gctx.AddLineToPoint(arrowhead[1].X, arrowhead[1].Y);
//				gctx.AddLineToPoint(arrowhead[2].X, arrowhead[2].Y);
//				gctx.ClosePath();
//				
//				gctx.DrawPath(CGPathDrawingMode.FillStroke);
//
//				gctx.RestoreState();
//			}
//		}

		// This version handles direct statements of affinity
		internal void HilightSpoke(int fromCharacter, int toCharacter, bool isDashed)
		{
			mvc = ((MainView)this.Superview).mvc;

			using (gctx = UIGraphics.GetCurrentContext ())
			{
				float[] dashed = { 10, 8 };
				float[] solid = { 1, 0 };
				int affinity = 0;

				if (UIDevice.CurrentDevice.UserInterfaceIdiom == UIUserInterfaceIdiom.Pad)
				{
					gctx.SetLineWidth(8f);
				}
				else
				{
					gctx.SetLineWidth(4f);
				}

				if (isDashed)
				{
					gctx.SetLineDash(0, dashed, 2);

					if (Story.Phase == Story.ReactionAnimation1 || Story.Phase == Story.ReactionAnimation3) affinity = Story.FeedbackFace[Story.ILikeWhatIHear, Story.Suspect];
					else affinity = Story.FeedbackFace[2, Story.Suspect];
				}
				else
				{
					if (fromCharacter == Story.Player) affinity = Story.CurrentAffinity;
					else affinity = mvc.GetAffinityIndex(fromCharacter, toCharacter);
				}

				double deltaX = Story.HexagonX[toCharacter] - Story.HexagonX[fromCharacter];
				double deltaY = Story.HexagonY[toCharacter] - Story.HexagonY[fromCharacter];
				double lengthX = deltaX * 0.48;
				double lengthY = deltaY * 0.48;
				int tipX = Story.HexagonX[fromCharacter] + (int)lengthX;
				int tipY = Story.HexagonY[fromCharacter] + (int)lengthY;

				gctx.BeginPath();

				gctx.SetStrokeColor(Story.AffinityLevelColor[affinity/*Story.CurrentAffinity*/].CGColor);
				CGPoint[] line = new CGPoint[] { new CGPoint(Story.HexagonX[fromCharacter], Story.HexagonY[fromCharacter]), new CGPoint(tipX, tipY) };
				
				gctx.MoveTo(line[0].X, line[0].Y);
				gctx.AddLineToPoint(line[1].X, line[1].Y);
				gctx.ClosePath();
				gctx.StrokePath();

				// DrawArrowHead // TODO: Create method for to avoid duplicate code in 149-173; 409-435
				gctx.SaveState();

				gctx.SetLineDash(0, solid, 0);
				gctx.SetFillColor(Story.AffinityLevelColor[affinity].CGColor);
				gctx.SetStrokeColor(Story.AffinityLevelColor[affinity].CGColor);
				double angleInRadians = Math.Atan2 (line[0].Y - line[1].Y, line[0].X -line[1].X);
				
				gctx.BeginPath();
				
				gctx.TranslateCTM(line[1].X, line[1].Y);
				gctx.RotateCTM((float)(angleInRadians -  Math.PI / 2));
				
				CGPoint[] arrowhead = new CGPoint[] {
					new CGPoint (0.0f - arrowHeadSize, 0.0f),
					new CGPoint (0.0f, 0.0f - arrowHeadSize),
					new CGPoint (0.0f + arrowHeadSize, 0.0f)
				};
				
				gctx.MoveTo(arrowhead[0].X, arrowhead[0].Y);
				gctx.AddLineToPoint(arrowhead[1].X, arrowhead[1].Y);
				gctx.AddLineToPoint(arrowhead[2].X, arrowhead[2].Y);
				gctx.ClosePath();
				
				gctx.DrawPath(CGPathDrawingMode.FillStroke);
				
				gctx.RestoreState();

				mvc.DrawFace(mvc.GetCharacterView(fromCharacter), affinity);

				if (!isDashed)
				{
					// if (iDisplay == mainDisplay) { // TODO: We're already in the MainView but could need conditional later for end game

					string quote;
					if (fromCharacter == Story.Player) quote = "You say that ";
					else quote = Story.Names[fromCharacter] + " says that ";

					quote += Story.Names[toCharacter] + " is ";

					// Add description based on gender of toCharacter
					if (toCharacter == 1 || toCharacter == 2 || toCharacter == 4) quote += Story.GuyDescription[fromCharacter, affinity/*Story.CurrentAffinity*/];
					else quote += Story.GalDescription[fromCharacter, affinity/*Story.CurrentAffinity*/];

					quote += ".";

					mvc.PostMessage(quote);

					// }
				}
			}

			/* DONE Java code - hilightSpoke
			private void hilightSpoke(int iFromCharacter, int iToCharacter, boolean fIsDashed) {
			// This version handles direct statements of affinity
	    	//float dash1[] = {10, 10};
	    	//int iAffinity=0;
	   	 	//if (fIsDashed) {
	   	 	//	BasicStroke dashed = new BasicStroke(10.0f, BasicStroke.CAP_BUTT, BasicStroke.JOIN_MITER, 10.0f, dash1, 0.0f);
			//	g2.setStroke(dashed);
			//	if ((iPhase==reactionAnimation1)|(iPhase==reactionAnimation3)) 
			//		iAffinity=feedbackFace[iLikeWhatIHear][iSuspect];
			//	else
			//		iAffinity=feedbackFace[2][iSuspect];
			//}
			//else {
			//	g2.setStroke(new BasicStroke(8));
			//	if (iFromCharacter==player)
			//		iAffinity=buttonValue;
			//	else
			//		iAffinity=getAffinityIndex(iFromCharacter,iToCharacter);
			//}
	    	try {
	   	 	//	g2.setColor(affinityLevelColor[iAffinity]);
	    	}
	    	catch (Exception e) {
	   	 		System.out.println("Error in highlightSpoke: iAffinity out of range: "+iAffinity);
	    	}
			//double deltaX=hexagonX[iToCharacter]-hexagonX[iFromCharacter];
			//double deltaY=hexagonY[iToCharacter]-hexagonY[iFromCharacter];
			//double lengthX=deltaX*0.48;
			//double lengthY=deltaY*0.48;
			//int tipX=hexagonX[iFromCharacter]+(int)lengthX;
			//int tipY=hexagonY[iFromCharacter]+(int)lengthY;
			//g2.drawLine(hexagonX[iFromCharacter],hexagonY[iFromCharacter],tipX,tipY);
			//Line2D.Double line = new Line2D.Double(hexagonX[iFromCharacter],hexagonY[iFromCharacter],tipX,tipY);
			//drawArrowHead(g2,line,11);
			//drawFace(iFromCharacter,iAffinity);
			//if (!fIsDashed) {
				if (iDisplay==mainDisplay) {
			//		String quote;
			//		if (iFromCharacter==player) {
			//			quote="You say that ";
			//		}
			//		else
			//			quote=names[iFromCharacter]+" says that ";
			//		quote+=names[iToCharacter]+" is ";
			//		// add description based on gender of iToCharacter
			//		if ((iToCharacter==1)|(iToCharacter==2)|(iToCharacter==4))
			//			quote+=guyDescription[iFromCharacter][iAffinity];
			//		else
			//			quote+=galDescription[iFromCharacter][iAffinity];
			//		quote+=".";
			//		postMessage(quote);
				}
			}
		}
			 */
		}

		// This version handles indirect statements of affinity
		internal void HilightSpoke(int fromCharacter, int toCharacter, int speaker)
		{
			float[] solid = { 1, 0 };
			int perceivedAffinity;

			if (speaker == Story.Player)
			{
				perceivedAffinity = Story.CurrentAffinity;
			}
			else
			{
				perceivedAffinity = mvc.GetPAffinityIndex(speaker, fromCharacter, toCharacter);
			}

			if (UIDevice.CurrentDevice.UserInterfaceIdiom == UIUserInterfaceIdiom.Pad)
			{
				gctx.SetLineWidth(7f);
			}
			else
			{
				gctx.SetLineWidth(3.5f);
			}

			double deltaX = Story.HexagonX[toCharacter] - Story.HexagonX[fromCharacter];
			double deltaY = Story.HexagonY[toCharacter] - Story.HexagonY[fromCharacter];
			double lengthX = deltaX * 0.48;
			double lengthY = deltaY * 0.48;
			int tipX = Story.HexagonX[fromCharacter] + (int)lengthX;
			int tipY = Story.HexagonY[fromCharacter] + (int)lengthY;

			gctx.BeginPath();

			gctx.SetStrokeColor(Story.AffinityLevelColor[perceivedAffinity].CGColor);
			CGPoint[] line = new CGPoint[] { new CGPoint(Story.HexagonX[fromCharacter], Story.HexagonY[fromCharacter]), new CGPoint(tipX, tipY) };
			
			gctx.MoveTo(line[0].X, line[0].Y);
			gctx.AddLineToPoint(line[1].X, line[1].Y);
			gctx.ClosePath();
			gctx.StrokePath();

			// DrawArrowHead // TODO: Create method for to avoid duplicate code in 149-173; 220-244
			gctx.SaveState();
			
			gctx.SetLineDash(0, solid, 0);
			gctx.SetFillColor(Story.AffinityLevelColor[perceivedAffinity].CGColor);
			gctx.SetStrokeColor(Story.AffinityLevelColor[perceivedAffinity].CGColor);
			double angleInRadians = Math.Atan2 (line[0].Y - line[1].Y, line[0].X -line[1].X);
			
			gctx.BeginPath();
			
			gctx.TranslateCTM(line[1].X, line[1].Y);
			gctx.RotateCTM((float)(angleInRadians -  Math.PI / 2));
			
			CGPoint[] arrowhead = new CGPoint[] {
				new CGPoint (0.0f - arrowHeadSize, 0.0f),
				new CGPoint (0.0f, 0.0f - arrowHeadSize),
				new CGPoint (0.0f + arrowHeadSize, 0.0f)
			};
			
			gctx.MoveTo(arrowhead[0].X, arrowhead[0].Y);
			gctx.AddLineToPoint(arrowhead[1].X, arrowhead[1].Y);
			gctx.AddLineToPoint(arrowhead[2].X, arrowhead[2].Y);
			gctx.ClosePath();
			
			gctx.DrawPath(CGPathDrawingMode.FillStroke);
			
			gctx.RestoreState();

			mvc.DrawFace(mvc.GetCharacterView(fromCharacter), perceivedAffinity);

			string quote;

			if (speaker == Story.Player) quote = "You say \"";
			else quote = Story.Names[speaker] + " says \"";

			quote += Story.Names[fromCharacter] + " told me that you are ";

			// Add description based on gender of toCharacter
			if (toCharacter == 1 || toCharacter == 2 || toCharacter == 4) quote += Story.GuyDescription[fromCharacter, perceivedAffinity];
			else quote += Story.GalDescription[fromCharacter, perceivedAffinity];

			quote += ".\"";

			mvc.PostMessage(quote);

			// TODO: Now add the big quotation marks around the face
			// g2.drawImage(quotationMarks,faces[iFromCharacter][0].getX()-28,faces[iFromCharacter][0].getY()-10,transparent,this);

			/* DONE Java code - hilightSpoke (indirect statements)
			private void hilightSpoke(int iFromCharacter, int iToCharacter, int iSpeaker) {
			// This version handles indirect statements of affinity
			//g2.setStroke(new BasicStroke(7));
			//int iPerceivedAffinity=0;
			//if (iSpeaker==player)
			//	iPerceivedAffinity=buttonValue;
			//else
			//	iPerceivedAffinity=getPAffinityIndex(iSpeaker,iFromCharacter,iToCharacter);
//			g2.setColor(uncertainifyColor(iPerceivedAffinity, certainty[speaker][fromCharacter][toCharacter]));
			//g2.setColor(affinityLevelColor[iPerceivedAffinity]);
			//double deltaX=hexagonX[iToCharacter]-hexagonX[iFromCharacter];
			//double deltaY=hexagonY[iToCharacter]-hexagonY[iFromCharacter];
			//double lengthX=deltaX*0.48;
			//double lengthY=deltaY*0.48;
			//int tipX=hexagonX[iFromCharacter]+(int)lengthX;
			//int tipY=hexagonY[iFromCharacter]+(int)lengthY;
			//g2.drawLine(hexagonX[iFromCharacter],hexagonY[iFromCharacter],tipX,tipY);
			//Line2D.Double line = new Line2D.Double(hexagonX[iFromCharacter],hexagonY[iFromCharacter],tipX,tipY);
			//drawArrowHead(g2, line,11);
			//drawFace(iFromCharacter,iPerceivedAffinity);

			//String quote;
			//if (iSpeaker==player)
			//	quote="You say \"";
			//else 
			//	quote=names[iSpeaker]+" says \"";
			//quote+=names[iFromCharacter]+" told me that you are ";
			// add description based on gender of iToCharacter
			//if ((iToCharacter==1)|(iToCharacter==2)|(iToCharacter==4))
			//	quote+=guyDescription[iFromCharacter][iPerceivedAffinity];
			//else
			//	quote+=galDescription[iFromCharacter][iPerceivedAffinity];
			//quote+=".\"";
			//postMessage(quote);
		
			// now add the big quotation marks around the face
			//g2.drawImage(quotationMarks,faces[iFromCharacter][0].getX()-28,faces[iFromCharacter][0].getY()-10,transparent,this);
		
	}
			 */

		}

		private double DegreeToRadian(double angle)
		{
			return Math.PI * angle / 180.0;
		}

		private int GetXOffset(int characterId)
		{
			if (UIDevice.CurrentDevice.UserInterfaceIdiom == UIUserInterfaceIdiom.Pad)
			{
				return 0;
			}
			else
			{
				if (characterId == 0)
					return -35;
				else if (characterId == 1 || characterId == 5) return -20;
				else if (characterId == 2 || characterId == 4) return 20;
				else return 35;
			}
		}

		private int GetYOffset(int characterId)
		{
			if (UIDevice.CurrentDevice.UserInterfaceIdiom == UIUserInterfaceIdiom.Pad)
			{
				if (characterId == 1 || characterId == 2) return -7; 
				else if (characterId == 4 || characterId == 5) return 7;
				else return 0;
			}
			else
			{
				if (characterId == 1 || characterId == 2) return 20;
				else if (characterId == 4 || characterId == 5) return -20;
				else return 0;
			}
		}
	}
}

