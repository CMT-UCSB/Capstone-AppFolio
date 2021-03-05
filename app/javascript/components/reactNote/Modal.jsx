import React from 'react';
import ReactDOM from 'react-dom'
import NoteForm from './NoteForm'
import FocusTrap from 'focus-trap-react'

export const Modal = ({
    onClickOutside,
    onKeyDown,
    modalRef,
    buttonRef,
    closeModal,
    updateNote,
    note,
    create
}) => {
    return ReactDOM.createPortal (
        <FocusTrap>
            <aside
                tag="aside"
                role="dialog"
                tabIndex="-1"
                aria-modal="true"
                className="popup-cover"
                onClick={onClickOutside}
                onKeyDown={onKeyDown}
            >
                <div className="popup-area" ref={modalRef}>
                    <button
                        ref={buttonRef}
                        aria-label="Close Modal"
                        aria-labelledby="close-modal"
                        className="_popup-close"
                        onClick={closeModal}
                    >
                        <span id="close-modal" className="_hide-visual">
                            Close
                        </span>
                        <svg className="_popup-close-icon" viewBox="0 0 40 40">
                            <path d="M 10,10 L 30,30 M 30,10 L 10,30" />
                        </svg>
                    </button>
                    <div className="popup-body">
                        <NoteForm updateNote={updateNote} closeModal={closeModal} note={note} create={create}/>
                    </div>
                </div>
            </aside>
        </FocusTrap>,
        document.body
    );
};
export default Modal;