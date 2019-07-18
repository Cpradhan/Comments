namespace CommentsAPI.Models{
    public class Comment
    {
		public int Id { get; set; }
        public string AppId { get; set; }
        public string SheetId { get; set; }
        public string UserName { get; set; }
        public string UserSelections { get; set; }
        public string CommentText { get; set; }
        public string Mode { get; set; }    
        public string Importance { get; set; }
        public System.DateTime Created { get; set; }
    }
}
