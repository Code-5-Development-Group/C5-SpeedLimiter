import { useState } from 'react';
import { Modal, Button, Form } from 'react-bootstrap';
import { useNuiEvent } from '../hooks/useNuiEvent';
import { fetchNui } from '../utils/fetchNui';

const App = () => {
	const [Show, setShow] = useState(false);

	const [Speed, setSpeed] = useState('20');

	const handleClose = () => fetchNui('hideFrame');

	useNuiEvent('setShow', setShow);

	return (
		<Modal show={Show} onHide={handleClose}>
			<Modal.Header closeButton>
				<Modal.Title>Speed Limiter</Modal.Title>
			</Modal.Header>
			<Modal.Body>
				<Form>
					<Form.Group>
						<Form.Label>Speed</Form.Label>

						<Form.Control
							type='text'
							placeholder='20'
							value={Speed}
							onChange={(e) => setSpeed(e.target.value)}
						/>
					</Form.Group>
				</Form>
			</Modal.Body>
			<Modal.Footer>
				<Button
					variant='secondary'
					onClick={() =>
						fetchNui('setMaxSpeed', {
							maxSpeed: Speed,
						})
					}
				>
					Set Speed Limit
				</Button>
			</Modal.Footer>
		</Modal>
	);
};

export default App;
