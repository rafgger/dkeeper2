import List "mo:base/List";
import Debug "mo:base/Debug";

// crud style

actor DKeeper { // actor is canister

  public type Note = {  // data type  // public to access this type from the javascript side
      title: Text;
      content: Text;
  };

  var notes: List.List<Note> = List.nil<Note>(); // contain note type, empty nil object

  public func createNote(titleText: Text, contextText: Text) {

    let newNote: Note = {
      title = titleText;
      content = contextText;
    };
    
  notes := List.push(newNote, notes);
  Debug.print(debug_show (notes));
  };
}