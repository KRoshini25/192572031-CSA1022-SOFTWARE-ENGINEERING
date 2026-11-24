from login import login


def test_valid_credentials():
    assert login("alice", "wonderland") is True


def test_wrong_password():
    assert login("alice", "nope") is False


def test_unknown_user():
    assert login("mallory", "x") is False
