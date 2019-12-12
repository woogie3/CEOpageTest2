import React from 'react';
import queryString from 'query-string';

const QnA = ({location, match}) => {
    const query = queryString.parse(location.search);

    const detail = query.detail === 'true';

    return (
        <div>
            
        </div>
    );
};

export default QnA;