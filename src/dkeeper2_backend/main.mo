import List "mo:base/List";
import Debug "mo:base/Debug";

// crud style

actor DKeeper { // actor is canister

  public type Note = {  // data type  // public to access this type from the javascript side
      title: Text;
      content: Text;
  };

  stable var notes: List.List<Note> = List.nil<Note>(); // contain note type, empty nil object

  public func createNote(titleText: Text, contextText: Text) {
    let newNote: Note = {
      title = titleText;
      content = contextText;
    };    
    notes := List.push(newNote, notes);
    Debug.print(debug_show (notes));
  };

  public query func readNotes(): async [Note]{ // query to speed up
    return List.toArray(notes);
  }; 

  public func deleteNote(id: Nat) {
    if (id < List.size(notes)) {
      let listFront = List.take(notes, id);
      let listBack = List.drop(notes, id + 1);
      notes := List.append(listFront, listBack);
    } else {
      Debug.print("Index out of bounds");
    };
  };

}