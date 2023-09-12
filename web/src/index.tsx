import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import App from './components/App';
import { VisibilityProvider } from './providers/VisibilityProvider';

import 'bootstrap/dist/css/bootstrap.min.css';

ReactDOM.render(
	<React.StrictMode>
		<VisibilityProvider>
			<App />
		</VisibilityProvider>
	</React.StrictMode>,
	document.getElementById('root')
);
