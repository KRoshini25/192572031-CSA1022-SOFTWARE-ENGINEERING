"""A deliberately simple login function (demo only - never store plain-text passwords)."""
import hashlib
import hmac

# username -> sha256(password)
_USERS = {
    "alice": hashlib.sha256(b"wonderland").hexdigest(),
    "bob": hashlib.sha256(b"builder123").hexdigest(),
}


def _hash(password: str) -> str:
    return hashlib.sha256(password.encode()).hexdigest()


def login(username: str, password: str) -> bool:
    """Return True when the username exists and the password matches."""
    stored = _USERS.get(username)
    if stored is None:
        return False
    return hmac.compare_digest(stored, _hash(password))


if __name__ == "__main__":
    import getpass

    user = input("Username: ")
    print("Login successful" if login(user, getpass.getpass("Password: ")) else "Invalid credentials")
