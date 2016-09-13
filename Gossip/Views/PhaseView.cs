using System;
using CoreGraphics;
using Foundation;
using UIKit;

namespace Gossip
{
	[Register("PhaseView")]
	public class PhaseView : TextView
	{
		public PhaseView ()
		{
			if (UIDevice.CurrentDevice.UserInterfaceIdiom == UIUserInterfaceIdiom.Pad)
			{
				location = new CGPoint(150f, 2f);
				dimensions = new CGSize(500f, 30f);
				translationY = 20f;

				fontSize = 24f;
			}
			else
			{
				location = new CGPoint(100f, 2f);
				dimensions = new CGSize(300f, 13f);
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
			
				string phase = GetPhaseName(Story.Phase);

				gctx.ShowTextAtPoint(0f, 0f, phase);
			}
		}

		private string GetPhaseName(int phaseId)
		{
			string phase = string.Empty;

			switch (Story.Phase)
			{
			case 0:
				phase = "PlayerSelectsCallee";
				break;
			case 1:
				phase = "Ring";
				break;
			case 2:
				phase = "PlayerSelectsPredicate";
				break;
			case 3:
				phase = "PlayerDeclaresDirectAffinity";
				break;
			case 4:
				phase = "ReactionAnimation1";
				break;
			case 5:
				phase = "NpcRespondsDirectAffinity";
				break;
			case 6:
				phase = "PlayerDeclaresIndirectAffinity";
				break;
			case 7:
				phase = "ReactionAnimation2";
				break;
			case 8:
				phase = "NpcRespondsIndirectAffinity";
				break;
			case 9:
				phase = "PlayerHangsUp";
				break;
			case 10:
				phase = "NpcTurn";
				break;
			case 11:
				phase = "NpcCallsPlayer";
				break;
			case 12:
				phase = "NpcDeclaresDirectAffinity";
				break;
			case 13:
				phase = "PlayerRespondsDirectAffinity";
				break;
			case 14:
				phase = "ReactionAnimation3";
				break;
			case 15:
				phase = "NpcDeclaresIndirectAffinity";
				break;
			case 16:
				phase = "PlayerRespondsIndirectAffinity";
				break;
			case 17:
				phase = "ReactionAnimation4";
				break;
			case 18:
				phase = "NpcHangsUp";
				break;
			}

			return phase;
		}
	}
}

