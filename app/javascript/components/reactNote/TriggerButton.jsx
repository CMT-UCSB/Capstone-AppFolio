import React from 'react'

const TriggerButton = ({ triggerText, buttonRef, showModal }) => {
    return (
        <button
            className="btn center modal-button btn-sm"
            ref={buttonRef}
            onClick={showModal}
        >
            {triggerText}
        </button>
    );
};
export default TriggerButton