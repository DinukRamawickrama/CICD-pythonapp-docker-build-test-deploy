import pytest
from app import app

print("Test file loaded")

@pytest.fixture
def client():
    app.config["TESTING"] = True
    with app.test_client() as client:
        yield client

def test_app_is_working(client):
    print("Running test")
    response = client.get('/')
    assert response.status_code == 200
    assert b"Hello CICD World!" in response.data
