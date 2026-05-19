"""Neural network import test generation"""

import torch
from torch import nn
from pysrc.ml_import_helper import make_yaml, test_nn


class Net(nn.Module):
    def __init__(self) -> None:
        super().__init__()
        self.norm1 = nn.LayerNorm((4, 10, 11, 12))
        self.layer1 = nn.Conv3d(4, 1, 5)
        self.flatten1 = nn.Flatten()

    def forward(self, net_input: torch.Tensor) -> torch.Tensor:
        x = self.norm1(net_input)
        x = self.layer1(x)
        x = self.flatten1(x)
        return x


def ml_model_import_050(dir_save):
    net = Net()
    make_yaml(net, dir_save)
    test_nn(net, dir_save, ["layer1", "norm1"])
    return 0
