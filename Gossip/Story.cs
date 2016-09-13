using System;
using System.Collections;
using System.Collections.Generic;

using Foundation;
using UIKit;

namespace Gossip
{
	public sealed class Story
	{
		private static readonly Story instance = new Story();

		private Story() {}

		public static Story Instance { get { return instance; } }

		public static bool Debug = false;
		public static bool Free = false;

		public const float OptionOffset = 70f;

		public static string Version = "1.1";

		public enum Character { Bara = 0, Owen = 1, Max = 2, Ella = 3, Mort = 4, Zoe = 5 }
		public enum SoundType { Ring = 0, Hello = 1, Goodbye = 2 }
//		public enum Button { Rules = 6, Tips = 7, UpArrow = 8, DownArrow = 9, Enter = 10 }
		public enum Button { Rules = 3, Tips = 15, UpArrow = 0, DownArrow = 1, Enter = 10 /*2*/ }
		public enum AffinityLevel {Hello = 9, Adorable = 8, Great = 7, Nice = 6, Pleasant = 5, SoSo = 4, Unpleasant = 3, NotNice = 2, Nasty = 1, Hateful = 0 }

		public const int MaxCharacters = 6; // Number of characters
		public const int AffinityLevels = 9; // Number of permitted expressions
		public const int Nobody = -1;
		public const int Anybody = - 1;
		
		// These are the different displays that can be presented
//		public const int MainDisplay = 0;
//		public const int RulesDisplay = 1;
//		public const int TitleDisplay = 2;
		public const int EndGameDisplay = 3;
//		public const int BackgroundDisplay = 4;
//		public const int OptionsDisplay = 5;
//		public const int TipsDisplay = 6;
		
		// Phase definitions
		public const int PlayerSelectsCallee = 0;
		public const int Ring = 1;
		public const int PlayerSelectsPredicate = 2;
		public const int PlayerDeclaresDirectAffinity = 3;
		public const int ReactionAnimation1 = 4;
		public const int NpcRespondsDirectAffinity = 5;
		public const int PlayerDeclaresIndirectAffinity = 6;
		public const int ReactionAnimation2 = 7;
		public const int NpcRespondsIndirectAffinity = 8;
		public const int PlayerHangsUp = 9;
		public const int NpcTurn = 10;
		public const int NpcCallsPlayer = 11;
		public const int NpcDeclaresDirectAffinity = 12;
		public const int PlayerRespondsDirectAffinity = 13;
		public const int ReactionAnimation3 = 14;
		public const int NpcDeclaresIndirectAffinity = 15;
		public const int PlayerRespondsIndirectAffinity = 16;
		public const int ReactionAnimation4 = 17;
		public const int NpcHangsUp = 18;

		public static bool Quit; // Is it time to quit the game?
		public static int MaxTurns; // How long will the game be?
		public static int Turn; // How many turns have we played so far?
		public static int Phase; // The all-important phase index
		public static int Display; // Specifies which display mode we're in. See above constants
		public static int Player; // Variable specifying  which character is the player (for now it's always zero)
		public static bool EndGame; 
		public static bool Restart = false;

		public static int Characters; // The number of characters playing in this particular game
		public static int DifficultyLevel;
		public static int SubPhase; // Used during display phase NPC_TURN to animate faces

		// These two values are used to communicate feedback to the player
		public static int Suspect; // How much the speaker's statement disagrees with what I've previously heard
		public static int ILikeWhatIHear; // How agreeable I find the speaker's statement

		// These next three variables are of enormous importance. They specify who's who in any given conversation.
		// Caller is always the person who initiated the call
		// Callee is the person who was called
		// Predicate is the one they're talking about
		//
		// Since they alternate during a conversation, we also track two additional indices
		// Speaker is the person actually saying something
		// Listener is the person hearing it
		//
		// There are two forms of statement, direct and indirect
		// Direct: "Speaker tells Listener that Speaker thinks that Pedicate is {adjective}."
		// Indirect: "Speaker tells Listener that Predicate told Speaker that Listener is {adjective}."
		//
		// The adjectives in the above statements are statements of affinity; they are specified with
		// GuyDescription and GalDescription
		public static int Caller;
		public static int Callee;
		public static int Predicate;

		public static int Selected; // Used to determine when another character other than current
		public static int CurrentAffinity; // Current affinity that we're using for display or calculations (was buttonValue in Chris' code)

		// The names of the six characters
		public static string[] Names = new string[MaxCharacters];

		// The onscreen locations of the six characters
		public static int[,] CharacterLocations = new int[MaxCharacters, 2];

		// How much the first character likes the second character. Bounded Number
		public static double[,] Affinity = new double[MaxCharacters, MaxCharacters];

		// Perceived affinity of second for third as perceived by first. Bounded Number
		public static double[,,] PerceivedAffinity = new double[MaxCharacters, MaxCharacters, MaxCharacters];

		// Average of the affinities towards the character, for each turn
		public static double[,] Popularity = new double[MaxCharacters, 10];

		// Personality traits
		public static double[] Dishonest = new double[MaxCharacters];
		public static double[] Gullible = new double[MaxCharacters];
		public static double[] Vain = new double[MaxCharacters];

		// Location on the screen of the character's faces
		public static int[] HexagonX = new int[MaxCharacters];
		public static int[] HexagonY = new int[MaxCharacters];

		// Strings used in player feedback
		public static string[,,] DirectFeedback = new string[MaxCharacters, 3, 3];
		public static string[,] IndirectFeedback = new string[MaxCharacters, 3];
		public static int[,] FeedbackFace = new int[3, 3];

		// Color assignment for each of the nine discrete affinity levels, plus transparency
		public static UIColor[] AffinityLevelColor = new UIColor[AffinityLevels + 1];

		// Adjective describing affinity
		public static string[] AffinityLevelText = new string[AffinityLevels + 1];
		public static string[,] GuyDescription = new string[MaxCharacters, AffinityLevels + 1];
		public static string[,] GalDescription = new string[MaxCharacters, AffinityLevels + 1];

		public static List<History> HistoryBook = new List<History>();
	}

	public class History 
	{
		public int Speaker { get; set; }
		public int Source { get; set; }
		public int Listener { get; set; }
		public int Predicate { get; set; }
		public int Value { get; set; }

		public History()
		{
		}
	}
}

