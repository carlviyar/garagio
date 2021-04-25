import PropTypes from 'prop-types'
import React from "react";

const Button = ({ text, onClick }) => {
    return (
        <button
            onClick={onClick}
            className='btn btn-lg custom-button'
        >
            {text}
        </button>
    )
}

Button.defaultProps = {
    color: 'steelblue',
}

Button.propTypes = {
    text: PropTypes.string,
    color: PropTypes.string,
    onClick: PropTypes.func,
}

export default Button