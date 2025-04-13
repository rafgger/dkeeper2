import { useState } from 'react';
// import { dkeeper2_backend } from 'declarations/dkeeper2_backend';
import Header from "./modules/Header";
import Footer from "./modules/Footer";
import Note from "./Note";
import CreateArea from "./modules/CreateArea";
import { dkeeper2_backend } from "../../declarations/dkeeper2_backend" // canister name

function App() {
  const [notes, setNotes] = useState([]);

  function addNote(newNote) {
    setNotes(prevNotes => {
      dkeeper2_backend.createNote(newNote.title, newNote.content)
      return [...prevNotes, newNote];
    });
  }

  function deleteNote(id) {
    setNotes(prevNotes => {
      return prevNotes.filter((noteItem, index) => {
        return index !== id;
      });
    });
  }

  return (
    <div>
      <Header />
      <CreateArea onAdd={addNote} />
      {notes.map((noteItem, index) => {
        return (
          <Note
            key={index}
            id={index}
            title={noteItem.title}
            content={noteItem.content}
            onDelete={deleteNote}
          />
        );
      })}
      <Footer />
    </div>
  );
}

export default App;
